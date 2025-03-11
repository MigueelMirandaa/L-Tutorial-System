# L-Tutorial - Interactive Tutorial System for FiveM

## 🌟 Description | Descripción

**English:**  
L-Tutorial is a standalone FiveM resource that provides an interactive tutorial system with dynamic camera movements and a modern UI interface. Perfect for introducing players to different locations and features of your server.

**Español:**  
L-Tutorial es un recurso independiente para FiveM que proporciona un sistema de tutoriales interactivo con movimientos de cámara dinámicos y una interfaz de usuario moderna. Perfecto para presentar a los jugadores diferentes ubicaciones y características de tu servidor.

## 🎥 Video Demo | Demostración en Video
- https://streamable.com/552auk

*Click on the link above to watch the demo video | Haz clic en el link de arriba para ver el video de demostración*

## ✨ Features | Características

**English:**
- 🎥 Dynamic camera system with smooth transitions
- 🎮 Interactive UI with modern design
- 📝 Configurable tutorial points
- 🔄 Sequential tutorial progression
- 🛡️ Player safety features during tutorials
- 🎯 Camera point-at functionality
- 📱 Responsive design

**Español:**
- 🎥 Sistema de cámara dinámico con transiciones suaves
- 🎮 Interfaz de usuario interactiva con diseño moderno
- 📝 Puntos de tutorial configurables
- 🔄 Progresión secuencial de tutoriales
- 🛡️ Características de seguridad para jugadores durante los tutoriales
- 🎯 Funcionalidad de enfoque de cámara
- 📱 Diseño responsivo

## 📥 Installation | Instalación

**English:**
1. Download the resource
2. Place it in your server's resources folder
3. Add `ensure L-Tutorial` to your server.cfg
4. Configure the tutorial points in `Shared/S-Shared.lua`

**Español:**
1. Descarga el recurso
2. Colócalo en la carpeta de recursos de tu servidor
3. Añade `ensure L-Tutorial` en tu server.cfg
4. Configura los puntos de tutorial en `Shared/S-Shared.lua`

## 🔧 Configuration | Configuración

**English:**  
Edit `Shared/S-Shared.lua` to add your tutorial points. Example configuration:

```lua
Config.Tutorials = {
    { 
        id = 1, 
        name = "Location Name", 
        desc = "Location description",
        coords = {
            camX = 0.0, camY = 0.0, camZ = 0.0,
            camRotX = 0.0, camRotY = 0.0, camRotZ = 0.0,
            pointAt = {x = 0.0, y = 0.0, z = 0.0},
            camFov = 50.0,
            transitionTime = 1000
        }
    }
}
```

**Español:**  
Edita `Shared/S-Shared.lua` para añadir tus puntos de tutorial. Ejemplo de configuración:

## 🎮 Usage | Uso

**English:**
- Start tutorial: `/showT` or use export `exports['L-Tutorial']:StartTutorial()`
- Stop tutorial: `/hideT`

**Español:**
- Iniciar tutorial: `/showT` o usa el export `exports['L-Tutorial']:StartTutorial()`
- Detener tutorial: `/hideT`

## 🔍 Dependencies | Dependencias

**English:**  
This is a standalone resource. No additional dependencies required.

**Español:**  
Este es un recurso independiente. No requiere dependencias adicionales.

## 📝 License | Licencia

**English:**  
This project is licensed under MIT License - feel free to use it on your server!

**Español:**  
Este proyecto está bajo la Licencia MIT - ¡siéntete libre de usarlo en tu servidor!

## 🤝 Support | Soporte

**English:**  
For support, please create an issue in the repository or contact the developer.

**Español:**  
Para soporte, por favor crea un issue en el repositorio o contacta al desarrollador.