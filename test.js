const net = require('net');

// Configurações do redirecionamento
const TARGET_HOST = '10.111.0.214'; // Destino final
const TARGET_PORT = 7000;          // Porta no destino final
const LISTEN_HOST = '10.111.0.15'; // IP que será interceptado
const LISTEN_PORT = 7000;          // Porta que será interceptada

// Criação do servidor proxy
const server = net.createServer((clientSocket) => {
    console.log('Conexão recebida do cliente:', clientSocket.remoteAddress);

    // Conecta ao destino final
    const targetSocket = net.createConnection(
        { host: TARGET_HOST, port: TARGET_PORT },
        () => {
            console.log('Conectado ao destino:', TARGET_HOST, TARGET_PORT);
        }
    );

    // Encaminha dados entre cliente e destino
    clientSocket.pipe(targetSocket);
    targetSocket.pipe(clientSocket);

    // Lida com erros
    clientSocket.on('error', (err) => {
        console.error('Erro no cliente:', err.message);
        targetSocket.end();
    });

    targetSocket.on('error', (err) => {
        console.error('Erro no destino:', err.message);
        clientSocket.end();
    });

    // Encerra conexões corretamente
    clientSocket.on('close', () => {
        console.log('Conexão com o cliente encerrada.');
        targetSocket.end();
    });

    targetSocket.on('close', () => {
        console.log('Conexão com o destino encerrada.');
        clientSocket.end();
    });
});

// Inicia o servidor proxy
server.listen(LISTEN_PORT, LISTEN_HOST, () => {
    console.log(`Proxy TCP ouvindo em ${LISTEN_HOST}:${LISTEN_PORT}`);
});
