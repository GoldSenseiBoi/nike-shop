<?php

namespace App\Controller;

use App\Entity\Product;
use App\Entity\Size;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;

class CartController extends AbstractController
{
    #[Route('/cart', name: 'cart_view')]
    public function view(SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $total = 0;

        foreach ($cart as $line) {
            $total += $line['product']->getPrice() * $line['quantity'];
        }

        $transport = 5.00;
        $grandTotal = $total + $transport;

        return $this->render('cart/view.html.twig', [
            'cart' => $cart,
            'total' => $total,
            'transport' => $transport,
            'grand_total' => $grandTotal,
        ]);
    }

    #[Route('/cart/add/{id}', name: 'cart_add')]
    public function add(Product $product, Request $request, SessionInterface $session, EntityManagerInterface $em): Response
    {
        $quantity = (int) $request->query->get('quantity', 1);
        $sizeId = (int) $request->query->get('size');

        if (!$sizeId) {
            $this->addFlash('error', 'Veuillez sélectionner une taille.');
            return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
        }

        $size = $em->getRepository(Size::class)->find($sizeId);
        if (!$size || !$product->getSizes()->contains($size)) {
            $this->addFlash('error', 'Taille invalide pour ce produit.');
            return $this->redirectToRoute('product_show', ['id' => $product->getId()]);
        }

        $cart = $session->get('cart', []);
        $key = $product->getId() . '_' . $size->getId();

        if (isset($cart[$key])) {
            $cart[$key]['quantity'] += $quantity;
        } else {
            $cart[$key] = [
                'product' => $product,
                'size' => $size,
                'quantity' => $quantity,
            ];
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/update/{id}/{size}', name: 'cart_update')]
    public function update(Product $product, Size $size, Request $request, SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $quantity = max((int) $request->request->get('quantity', 1), 1);
        $key = $product->getId() . '_' . $size->getId();

        if (isset($cart[$key])) {
            $cart[$key]['quantity'] = $quantity;
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/remove/{id}/{size}', name: 'cart_remove')]
    public function remove(Product $product, Size $size, SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $key = $product->getId() . '_' . $size->getId();

        if (isset($cart[$key])) {
            unset($cart[$key]);
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }
}
