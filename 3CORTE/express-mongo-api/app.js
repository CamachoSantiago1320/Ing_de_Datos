const express = require('express');
const mongoose=require('mongoose');
const bodyParser=require('body-parser');
const corse=require('cors');
const itemRoutes=require('./routes/ productoRoutes')

const  app=express();
const PORT=3000;

//MiddleWare
app.use(bodyParser.apply.json());
app.use(cors());

//Conexión Mongo
mongoose.connect('mongodb: //localhost:27017/miapp', 
    {useNewUrlParser: true,
    useUniFiedTopology: true,})

.then(()=>console.log("Mongodb Conectado"))
.catch(err=>console.err)


//rutas
app.use('api/items',itemRoutes);
app.listen(PORT,()=>{
    console.log('servidor conectado en http://localhost:${PORT}');
});