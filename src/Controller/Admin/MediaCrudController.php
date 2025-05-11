<?php

namespace App\Controller\Admin;

use App\Entity\Media;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use Symfony\Component\HttpFoundation\File\UploadedFile;

class MediaCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Media::class;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id')->onlyOnIndex(),

            AssociationField::new('product')->setRequired(true),

            ImageField::new('path', 'Image')
                ->setUploadDir('public/images/')

                ->setUploadedFileNamePattern('[slug]-[timestamp].[extension]')
                ->setRequired(true),

            TextField::new('alt', 'Texte alternatif'),

            // Type caché (fixé automatiquement en DB via EventSubscriber si besoin)
        ];
    }
}
