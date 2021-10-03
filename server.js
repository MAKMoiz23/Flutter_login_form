const express = require('express');
const mongoose = require('mongoose');
const URL = 'mongodb+srv://<user>:<password>@cluster0.x6tpm.mongodb.net/myFirstDatabase?retryWrites=true&w=majority'
const fUser = require('./model/user.js')

const app = express()

app.use(express.json())
app.use(express.urlencoded({extended: false}))

app.post('/addUser',(req, res)=>{
    const {email, password, rePassword}= req.body;
    console.log(email, password, rePassword);
    if(password !== password){
        res.json({success : false, msg: "Passwords doesn't match"})
    }
    const newfUser = new fUser({
        email,
        password
    })
    newfUser.save().then(
        user => res.json({success: true})
    ).catch(
        err => {console.log(err.message)
        res.end()}
    )
})

app.get(`/`,(req, res)=>{
    res.json({success: true})
})

app.post(`/login`,(req, res)=>{
    const {email, password} = req.body;
    fUser.findOne({email: email}, function (err, obj){
        try {
            if(obj.password === password){
                res.json({success: true, data: {email, password}})
            }
            else{
                res.json({"error": true, "message": "wrong password!"})
            }
        } catch (error) {
            res.json({"error": true, "message": "No such email exists!"})
        }
        
    });
})


mongoose.connect(URL, {useNewUrlParser: true, useUnifiedTopology: true}).then(
    app.listen(5000, ()=>{
        console.log(`The app is listening on PORT :5000`);
    })
).catch(err => console.log(err))


