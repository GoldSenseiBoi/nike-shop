<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\CommandLine;
use App\Entity\Product;
use App\Entity\Size;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class OrderController extends AbstractController
{
    #[Route('/order', name: 'order_create')]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function create(SessionInterface $session, EntityManagerInterface $em): Response
    {
        $cart = $session->get('cart', []);
        if (empty($cart)) {
            $this->addFlash('warning', 'Votre panier est vide.');
            return $this->redirectToRoute('cart_view');
        }

        $user = $this->getUser();
        $order = new Order();
        $order->setUser($user);
        $order->setValid(false);
        $order->setDateTime(new \DateTime());
        $order->setOrderNumber(uniqid('CMD-'));

        foreach ($cart as $line) {
            $product = $em->getRepository(Product::class)->find($line['product']->getId());
            $size = $em->getRepository(Size::class)->find($line['size']->getId());

            $quantity = $line['quantity'];

            $orderLine = new CommandLine();
            $orderLine->setProduct($product);
            $orderLine->setQuantity($quantity);
            $orderLine->setOrder($order);
            $orderLine->setSize($size);

            $em->persist($orderLine);
            $order->addCommandLine($orderLine);
        }

        $em->persist($order);
        $em->flush();

        $session->remove('cart');

        return $this->render('order/confirmation.html.twig', [
            'order' => $order
        ]);
    }

    #[Route('/orders', name: 'order_list')]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function list(EntityManagerInterface $em): Response
    {
        $orders = $em->getRepository(Order::class)->findBy(
            ['user' => $this->getUser()],
            ['dateTime' => 'DESC']
        );

        return $this->render('order/list.html.twig', [
            'orders' => $orders
        ]);
    }

    #[Route('/order/{id}', name: 'order_show')]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function show(Order $order): Response
    {
        if ($order->getUser() !== $this->getUser()) {
            throw $this->createAccessDeniedException('Cette commande ne vous appartient pas.');
        }

        return $this->render('order/show.html.twig', [
            'order' => $order,
        ]);
    }
}
