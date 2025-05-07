/*todas las estructuras en mongo*/
const mongoose=require('mongoose');

const itemSchema=new mongoose.Schema({
    nombre:{type:String,require:true},
    descripcion: Sting,
    creadoEn:{type:Date,default:Date.now}
})

module.exports=mongoose.model('Item',itemSchema);