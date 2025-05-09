<?php

namespace App\Controller;

use App\Entity\Product;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;
use Symfony\Component\Routing\Annotation\Route;

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
    public function add(Product $product, Request $request, SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $quantity = (int) $request->query->get('quantity', 1);
        $productId = $product->getId();

        if (isset($cart[$productId])) {
            $cart[$productId]['quantity'] += $quantity;
        } else {
            $cart[$productId] = [
                'product' => $product,
                'quantity' => $quantity
            ];
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/update/{id}', name: 'cart_update')]
    public function update(Product $product, Request $request, SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $quantity = max((int) $request->request->get('quantity', 1), 1);
        $productId = $product->getId();

        if (isset($cart[$productId])) {
            $cart[$productId]['quantity'] = $quantity;
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }

    #[Route('/cart/remove/{id}', name: 'cart_remove')]
    public function remove(Product $product, SessionInterface $session): Response
    {
        $cart = $session->get('cart', []);
        $productId = $product->getId();

        if (isset($cart[$productId])) {
            unset($cart[$productId]);
        }

        $session->set('cart', $cart);

        return $this->redirectToRoute('cart_view');
    }
}
