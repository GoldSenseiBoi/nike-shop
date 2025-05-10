<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\CommandLine;
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
            $product = $line['product'];
            $quantity = $line['quantity'];
            $size = $line['size'] ?? null;

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
}
