<?php

declare(strict_types=1);

namespace App\Domain\User;

use JsonSerializable;
use Doctrine\ORM\Mapping\Column;
use Doctrine\ORM\Mapping\Entity;
use Doctrine\ORM\Mapping\GeneratedValue;
use Doctrine\ORM\Mapping\Id;
use Doctrine\ORM\Mapping\Table;

#[Entity, Table(name: 'usuario')]
class User implements JsonSerializable
{
    #[Id, Column(type: 'integer'), GeneratedValue(strategy: 'AUTO')]
    private int $id_usuario;

    #[Column(type: 'string', unique: true, nullable: false)]
    private string $email;

    #[Column(type: 'string', nullable: false)]
    private string $nombre;

    #[Column(type: 'integer', nullable: false)]
    private int $id_rol;

    public function __construct(?int $id_usuario, string $email, string $nombre, int $id_rol)
    {
        $this->id_usuario = $id_usuario;
        $this->email = $email;
        $this->nombre = $nombre;
        $this->id_rol = $id_rol;
    }

    public function getId(): ?int
    {
        return $this->id_usuario;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getName(): string
    {
        return $this->nombre;
    }

    public function getIdRol(): int
    {
        return $this->id_rol;
    }

    #[\ReturnTypeWillChange]
    public function jsonSerialize(): array
    {
        return [
            'id_usuario' => $this->id_usuario,
            'email' => $this->email,
            'nombre' => $this->nombre,
            'id_rol' => $this->id_rol,
        ];
    }
}
