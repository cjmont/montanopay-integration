workspace "MontanoPay Integration Architecture" "Descripción de la integración del sistema bancario de MontanoPay utilizando Kafka" {

    model {
        // Definición de personas y sistemas
        cliente = person "Cliente de MontanoPay" "Usuario que utiliza los servicios digitales del banco."

        coreBancario = softwareSystem "Core Bancario Tradicional" "El sistema bancario tradicional que maneja transacciones y cuentas."
        nuevoCoreDigital = softwareSystem "Nuevo Core Bancario Digital" "Nuevo sistema core bancario digitalizado para transacciones modernas."
        bancaWebMovil = softwareSystem "Banca Web y Móvil" "Plataforma para acceder a los servicios bancarios en línea y móviles."
        serviciosPago = softwareSystem "Plataforma de Servicios de Pago" "Sistema que gestiona los pagos electrónicos."
        apisTerceros = softwareSystem "APIs de Servicios de Terceros" "Integración con servicios externos para Open Banking."
        gestionRiesgos = softwareSystem "Sistema de Gestión de Riesgos" "Sistema que analiza los riesgos financieros."
        prevencionFraudes = softwareSystem "Sistema de Prevención de Fraudes" "Sistema que detecta y previene fraudes."
        kafkaSystem = softwareSystem "Kafka" "Plataforma de mensajería para la transmisión de eventos entre sistemas."

        // Definición de relaciones
        cliente -> bancaWebMovil "Usa para acceder a sus cuentas y servicios"
        bancaWebMovil -> kafkaSystem "Envía eventos a través de"
        coreBancario -> kafkaSystem "Envía eventos de transacciones"
        nuevoCoreDigital -> kafkaSystem "Envía y recibe eventos de transacciones"
        serviciosPago -> kafkaSystem "Envía solicitudes de pago"
        apisTerceros -> kafkaSystem "Solicita información financiera"
        gestionRiesgos -> kafkaSystem "Recibe eventos y analiza riesgos"
        prevencionFraudes -> kafkaSystem "Recibe eventos para detectar fraudes"
        kafkaSystem -> nuevoCoreDigital "Retransmite eventos de otros sistemas"
        kafkaSystem -> coreBancario "Sincroniza eventos con el core bancario tradicional"
    }

    configuration {
        scope softwaresystem
    }

}
