<?php

namespace App\DataFixtures;

use App\Entity\Size;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;

class SizeFixtures extends Fixture
{
    public const SIZE_REFERENCE_PREFIX = 'size_';

    public function load(ObjectManager $manager): void
    {
        for ($i = 36; $i <= 47; $i++) {
            $size = new Size();
            $size->setLabel((string) $i);

            $manager->persist($size);
            $this->addReference(self::SIZE_REFERENCE_PREFIX . $i, $size);
        }

        $manager->flush();
    }
}
