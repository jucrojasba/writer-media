# Writter Media 📖✨  

Writter Media es una red social diseñada especialmente para escritores, donde pueden compartir publicaciones y comentarios. Este proyecto incluye funciones avanzadas como autenticación, permisos y roles de usuario.  

---

## ✨ Funcionalidades principales  

- **Publicaciones**:  
  - Los usuarios pueden **crear**, **editar** y **eliminar** sus propias publicaciones.  
  - El administrador puede **inhabilitar publicaciones inapropiadas**.  

- **Comentarios**:  
  - Los usuarios pueden **crear** comentarios en publicaciones.  
  - El administrador puede **eliminar comentarios**.  

- **Autenticación**:  
  - Implementada con [Devise](https://github.com/heartcombo/devise).  
  - Gestión de usuarios autenticados con roles de **admin** y **usuario**.  

- **Cobertura de pruebas**:  
  - El proyecto tiene un **24% de cobertura en pruebas automatizadas**.  
  - Se han testeado las **validaciones** y los **scopes** de los modelos `Publication` y `Comment`.  

---

## 🛠️ Requisitos técnicos  

- **Ruby versión**: `>= 3.0`  
- **Rails versión**: `>= 7.0`  
- Base de datos: PostgreSQL  

---

## 🚀 Instalación  

### 1️⃣ Clonar el repositorio
```
bash
git clone https://github.com/jucrojasba/writer-media.git
cd writter-media
```

### 2️⃣ Configurar las credenciales  
Descarga el archivo `.env` desde el **Moodle** del curso y colócalo en el directorio raíz del proyecto.  

### 3️⃣ Instalar dependencias 
```
bash
bundle install
yarn install
```

### 4️⃣ Configurar la base de datos 
```
bash
rails db:create db:migrate db:seed
``` 

### 5️⃣ Iniciar el servidor  
```
bash
rails server
```

Accede al proyecto desde tu navegador en [http://localhost:3000](http://localhost:3000).  

---

## 🧪 Ejecución de pruebas  

Para ejecutar la suite de pruebas:  
bash
bundle exec rspec  

---

## 📷 Vista previa

![image](https://github.com/user-attachments/assets/bf8933fc-a62f-420a-a82c-8326732bdf3e)
![image](https://github.com/user-attachments/assets/12a42c0e-a01f-4c45-b875-e9ac7e5ee3a8)
![image](https://github.com/user-attachments/assets/341d29da-36bd-4c66-8d4f-dc822a9dbcfc)
![image](https://github.com/user-attachments/assets/b29e492a-ba7c-4f8d-a826-423c068f0852)








