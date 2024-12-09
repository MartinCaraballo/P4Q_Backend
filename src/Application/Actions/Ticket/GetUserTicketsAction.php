<?php

declare(strict_types=1);

namespace App\Application\Actions\Ticket;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;

class GetUserTicketsAction
{
    public function __invoke(Request $request, Response $response): Response
    {
        $tickets = [
            [
                'id_ticket' => 1,
                'titulo' => 'Ticket 1',
                'estado' => 'Pendiente',
                'fecha' => '2024-12-09',
            ],
            [
                'id_ticket' => 2,
                'titulo' => 'Ticket 2',
                'estado' => 'Pendiente',
                'fecha' => '2024-12-08',
            ],
        ];

        if (empty($tickets)) {
            return $response->withStatus(404)->withHeader('Content-Type', 'application/json');
        }

        $response->getBody()->write(json_encode($tickets));
        return $response->withHeader('Content-Type', 'application/json')->withStatus(200);
    }
}
