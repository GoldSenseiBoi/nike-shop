<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250510033411 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE category ADD media_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE category ADD CONSTRAINT FK_64C19C1EA9FDD75 FOREIGN KEY (media_id) REFERENCES media (id)
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_64C19C1EA9FDD75 ON category (media_id)
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE category DROP FOREIGN KEY FK_64C19C1EA9FDD75
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_64C19C1EA9FDD75 ON category
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE category DROP media_id
        SQL);
    }
}
