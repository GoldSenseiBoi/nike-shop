<?php

// src/Form/ProfileType.php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProfileType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        /** @var User $user */
        $user = $builder->getData();
        $address = $user->getCustomerAddress();

        $builder
            ->add('firstName', TextType::class)
            ->add('lastName', TextType::class)
            ->add('phone', TelType::class)
            ->add('email', EmailType::class)

            // Champs de CustomerAddress affichés à plat
            ->add('type', TextType::class, [
                'mapped' => false,
                'label' => 'Type',
                'data' => $address?->getType()
            ])
            ->add('address', TextType::class, [
                'mapped' => false,
                'label' => 'Adresse',
                'data' => $address?->getAddress()
            ])
            ->add('cp', TextType::class, [
                'mapped' => false,
                'label' => 'Code postal',
                'data' => $address?->getCp()
            ])
            ->add('city', TextType::class, [
                'mapped' => false,
                'label' => 'Ville',
                'data' => $address?->getCity()
            ])
            ->add('country', TextType::class, [
                'mapped' => false,
                'label' => 'Pays',
                'data' => $address?->getCountry()
            ])

            ->add('plainPassword', PasswordType::class, [
                'mapped' => false,
                'required' => false,
                'label' => 'Nouveau mot de passe'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
