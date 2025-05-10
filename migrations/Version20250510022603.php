<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20250510022603 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE command_line ADD size_id INT DEFAULT NULL
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE command_line ADD CONSTRAINT FK_70BE1A7B498DA827 FOREIGN KEY (size_id) REFERENCES size (id)
        SQL);
        $this->addSql(<<<'SQL'
            CREATE INDEX IDX_70BE1A7B498DA827 ON command_line (size_id)
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE product_size RENAME INDEX fk_product_size_size TO IDX_7A2806CB498DA827
        SQL);
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql(<<<'SQL'
            ALTER TABLE command_line DROP FOREIGN KEY FK_70BE1A7B498DA827
        SQL);
        $this->addSql(<<<'SQL'
            DROP INDEX IDX_70BE1A7B498DA827 ON command_line
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE command_line DROP size_id
        SQL);
        $this->addSql(<<<'SQL'
            ALTER TABLE product_size RENAME INDEX idx_7a2806cb498da827 TO fk_product_size_size
        SQL);
    }
}
