// IMPORTING MODULES
const express = require('express');
const http = require('http');
const mongoose = require('mongoose');

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require('./models/room');
var io = require("socket.io")(server);

// MIDDLE WARE
app.use(express.json()); 

const DB = "mongodb+srv://mizaeleduardo:1234qwer@cluster0.444bkru.mongodb.net/?retryWrites=true&w=majority";

io.onconnection('connection', (socket) => {
    console.log("connected!");
    socket.onconnection('createRoom', async ({nickname}) => {
        console.log(nickname);
        try {
            // room is created
        let room = new Room();
        let player = {
            socketID: socket.id,
            nickname,
            playerType: 'X',
        };
        room.players.push(player);
        room.turn = player;
        room = await room.save();
        console.log(room);
        const roomId = room._id.toString();

        socket.join(roomId);
        // io -> send data to everyone
        // socket -> sending data to yourself
        io.to(roomId).emit('createRoomSuccess', room);
        } catch (e) {
            console.log(e);
        }
        
    });
});

mongoose.connect(DB).then(() => {
    console.log("Connection successful!");
}).catch((e) => {
    console.log(e);
});

server.listen(port, '0.0.0.0', () => {
    console.log(`Server started and running on port ${port}`);
});
