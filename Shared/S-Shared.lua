Config = {}
-- TO ENABLE WHERE TO START TUTORIAL JUST ADD THIS LINE ON FIRST JOIN SYSTEM
-- exports['L-Tutorial']:StartTutorial() (also you can use /showT command)

Config.Tutorials = {
    { 
        id = 1, 
        name = 'Comisaría', 
        desc = '¡Bienvenido a la Comisaría de Los Santos! Aquí podrás reportar crímenes, solicitar ayuda policial, obtener licencias y permisos. Nuestros oficiales están disponibles 24/7 para mantener la seguridad ciudadana. También ofrecemos servicios de registro de vehículos y antecedentes penales. ¡La ley y el orden son nuestra prioridad!',
        coords = {
            x = 393.3160, y = -936.5289, z = 48.7508,
            camX = 393.3160, camY = -936.5289, camZ = 53.7508,
            camRotX = -20.0, camRotY = 0.0, camRotZ = 218.7436,
            pointAt = {x = 434.5002, y = -981.6192, z = 30.7111},
            camFov = 50.0,
            duration = 7000,
            transitionTime = 1000
        }
    },
    { 
        id = 2, 
        name = 'Hospital', 
        desc = 'El Hospital General de Los Santos es tu centro médico de confianza. Contamos con personal altamente cualificado para atender emergencias, realizar chequeos médicos y proporcionar tratamientos especializados. Recuerda que puedes contratar un seguro médico para reducir los costos. ¡Tu salud es nuestra principal preocupación!',
        coords = {
            x = 256.1534, y = -518.4595, z = 65.9587,
            camX = 256.1534, camY = -518.4595, camZ = 70.9587,
            camRotX = -20.0, camRotY = 0.0, camRotZ = 214.0192,
            pointAt = {x = 298.8422, y = -583.9390, z = 43.2597},
            camFov = 50.0,
            duration = 7000,
            transitionTime = 1000
        }
    },
    { 
        id = 3, 
        name = 'Ayuntamiento', 
        desc = 'El centro administrativo de nuestra ciudad. Aquí podrás realizar trámites gubernamentales, pagar impuestos, solicitar permisos de construcción y establecer negocios. Nuestro personal está dispuesto a ayudarte con cualquier gestión municipal. ¡Contribuye al desarrollo de Los Santos!',
        coords = {
            x = -545.0, y = -204.0, z = 38.2,
            camX = -540.0, camY = -208.0, camZ = 43.0,
            camRotX = -20.0, camRotY = 0.0, camRotZ = 45.0,
            pointAt = {x = -545.0, y = -204.0, z = 38.2},
            camFov = 50.0,
            duration = 7000,
            transitionTime = 1000
        }
    },
    { 
        id = 4, 
        name = 'Banco', 
        desc = 'En el Banco Pacific Standard garantizamos la seguridad de tu dinero. Ofrecemos servicios de cuentas corrientes, préstamos, inversiones y cajas de seguridad. Realiza transferencias, deposita tu nómina y gestiona tus finanzas con total confianza. ¡Tu prosperidad económica es nuestro objetivo!',
        coords = {
            x = 186.9308, y = 176.5981, z = 123.5785,
            camX = 186.9308, camY = 176.5981, camZ = 128.5785,
            camRotX = -20.0, camRotY = 0.0, camRotZ = 310.8249,
            pointAt = {x = 231.6769, y = 214.7238, z = 107.7686},
            camFov = 50.0,
            duration = 7000,
            transitionTime = 1000
        }
    },
}