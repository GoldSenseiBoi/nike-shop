<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\CustomerAddress;
use App\Form\ProfileType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\IsGranted;

class ProfileController extends AbstractController
{
    #[Route('/mon-compte', name: 'profile_edit')]
    #[IsGranted('IS_AUTHENTICATED_FULLY')]
    public function edit(Request $request, EntityManagerInterface $em): Response
    {
        /** @var User $user */
        $user = $this->getUser();

        // Crée l'adresse si elle n'existe pas encore
        $address = $user->getCustomerAddress();
        if (!$address) {
            $address = new CustomerAddress();
            $user->setCustomerAddress($address);
        }

        $form = $this->createForm(ProfileType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // Mise à jour manuelle des champs customerAddress
            $address->setType($form->get('type')->getData());
            $address->setAddress($form->get('address')->getData());
            $address->setCp($form->get('cp')->getData());
            $address->setCity($form->get('city')->getData());
            $address->setCountry($form->get('country')->getData());

            $em->persist($user);
            $em->flush();

            $this->addFlash('success', 'Profil mis à jour.');
            return $this->redirectToRoute('profile_edit');
        }

        return $this->render('profile/edit.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
