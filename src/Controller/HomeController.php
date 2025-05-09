<?php

namespace App\Controller;

use App\Entity\Category;
use App\Entity\Product;
use App\Repository\CategoryRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'entry_point')]
    public function entry(): Response
    {
        if ($this->getUser()) {
            return $this->redirectToRoute('accueil');
        }

        return $this->redirectToRoute('app_login');
    }

    #[Route('/accueil', name: 'accueil')]
    public function index(CategoryRepository $categoryRepo, ProductRepository $productRepo): Response
    {
        $categories = $categoryRepo->findAll();
        $featuredProducts = $productRepo->findBy([], null, 4); // 4 produits aléatoires

        return $this->render('home/index.html.twig', [
            'categories' => $categories,
            'featured_products' => $featuredProducts,
        ]);
    }

    #[Route('/categorie/{id}', name: 'category_show')]
    public function showCategory(Category $category): Response
    {
        return $this->render('home/category.html.twig', [
            'category' => $category,
            'products' => $category->getProducts(),
        ]);
    }

    #[Route('/produit/{id}', name: 'product_show')]
    public function showProduct(Product $product): Response
    {
        return $this->render('home/product.html.twig', [
            'product' => $product,
        ]);
    }
}
