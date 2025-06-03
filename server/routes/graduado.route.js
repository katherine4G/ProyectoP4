const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

app.get('/graduados', async (req, res) => {
  try {
    const graduados = await prisma.graduados.findMany();
    res.json(graduados);
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener los graduados' });
  }
});

app.post('/graduados', async (req, res) => {
  try {
    const nuevo = await prisma.graduados.create({
      data: req.body
    });
    res.status(201).json(nuevo);
  } catch (error) {
    res.status(400).json({ error: 'Error al crear el graduado' });
  }
});
