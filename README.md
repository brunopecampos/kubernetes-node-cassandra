## Opus Software Practical Project (cassandra + express + reactjs + nginx stack)

This project is an application stack including a cassandra database with two nodes, an express server, a reactjs server and a nginx server. The nginx serves only as a rev proxy and there is API defined in express with only two endpoints. The theme of the application is salary increaser. The presentation slides can be foun in this link: https://docs.google.com/presentation/d/16TtWRSn8AcezRbVU8crPLgCANge9AvscfevmMQfTK4A/edit?usp=sharing

## Requirements

- Docker
- Docker Compose

## Getting started

1. Clone the project to your machine : `git clone https://github.com/brunopecampos/opus-practical-presentation`
2. start the stack: `docker compose up`

## Built With

- [React](https://reactjs.org) - A progressive JavaScript framework.
- [Express](https://expressjs.com/) - Fast, unopinionated, minimalist web framework for Node.js.
- [Nginx](https://www.nginx.com/) - nginx [engine x] is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server, originally written by Igor Sysoev.
- [Cassandra](https://cassandra.apache.org/_/index.html) - Apache Cassandra is an open source NoSQL distributed database trusted by thousands of companies for scalability and high availability without compromising performance.
