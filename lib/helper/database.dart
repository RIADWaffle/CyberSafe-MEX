import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CoursesDataBase {
  List sections = [];
  List questions = [];

  // reference our box
  final _sectionsBox = Hive.box('sectionsBox');
  final _questionsBox = Hive.box('questionsBox');


  // load the data from database
  void loadData() {
    sections = _sectionsBox.get("sectionsList");
    questions = _questionsBox.get("questionList");
  }

  // update the database
  void updateDataBase() {
    _sectionsBox.put("sectionsList", sections);
  }

  // run this method if this is the 1st time ever opening this app
  void createInitialData() async {
    sections = [
      [1, "Escenario de Phishing"],
      [2, "Estafas Online"],
      [3, "Identidad Personal"],
      [4, "Importancia de contraseñas fuertes"],
      [5, "Actualizacion regular del software"],
      [6, "Medidas adicionales de seguridad"]
    ];

    questions = [
      [
        1,
        "¿Qué describe mejor al phishing?",
        [
          "Implica que actores maliciosos se hacen pasar por entidades de confianza para engañar a las personas",
          "Son empresas que te engañan para obtener tus datos vía Email.",
          "Una forma legítima de enviar correos electrónicos masivos a contactos comerciales."
        ],
        0
      ],
      [
        1,
        "¿Cuáles son los peligros del phishing?",
        [
          "pérdida financiera",
          "robo de identidad",
          "filtraciones de datos",
          "Todas las anteriores"
        ],
        3
      ],
      [
        1,
        "¿Qué consejo es más efectivo para evitar caer en una estafa de phishing?",
        [
          "Compartir contraseñas regularmente para mayor seguridad.",
          "Abrir cualquier correo electrónico que parezca importante sin verificar su origen.",
          "Hacer clic en enlaces de correo electrónico sin cuestionar su autenticidad.",
          "Verificar siempre la autenticidad de los correos electrónicos y enlaces antes de hacer clic o proporcionar información sensible"
        ],
        3
      ],
      [
        1,
        "Son características de un email de phishing: ",
        [
          "Saludos Genéricos y Solicitudes de Información Sensible",
          "Logotipo de las marca",
          "Dirección de correo correcta",
          "Nombre del remitente"
        ],
        0
      ],
      [
        1,
        "Es una forma de protegerse del phishing: ",
        [
          "Verifica la dirección de correo recibido",
          "Cerrar mi cuenta de email",
          "Poner mi correo en páginas que regalan dinero"
        ],
        0
      ],
      [
        1,
        "¿Por qué es importante no hacer clic en enlaces sospechosos en correos electrónicos?",
        [
          "Hacer clic en enlaces sospechosos suele llevar a descuentos y ofertas especiales.",
          "Hacer clic en enlaces sospechosos siempre es seguro, ya que los navegadores web modernos protegen contra cualquier amenaza.",
          "Hacer clic en enlaces sospechosos puede llevar a sitios web falsos o maliciosos diseñados para robar información personal o infectar un dispositivo con malware."
        ],
        2
      ],
      [
        1,
        "¿Cuál es uno de los métodos más comunes utilizados por los atacantes en ataques de phishing?",
        [
          "Suplantación de identidad de entidades de confianza",
          "Utilización de emojis en correos electrónicos para hacer que los mensajes parezcan más amigables.",
          "Inclusión de memes en mensajes para distraer a los destinatarios."
        ],
        0
      ],
      [
        1,
        "¿Qué se debe hacer si se recibe un correo electrónico sospechoso que parece ser de una entidad de confianza?",
        [
          "No hacer clic en ningún enlace ni proporcionar información sensible",
          "Hacer clic en el enlace para ver de qué se trata y luego decidir si es seguro o no.",
          "Responder al correo electrónico con toda la información requerida."
        ],
        0
      ],
      [
        1,
        "¿Qué tipo de información personal suelen buscar los atacantes en ataques de phishing?",
        [
          "Contraseñas, números de tarjeta de crédito, información bancaria",
          "Nombres de las mascotas de los destinatarios.",
          "Técnicas de pesca"
        ],
        0
      ],
      [
        1,
        "¿Cuál es una táctica comúnmente utilizada por los atacantes en el phishing para engañar a las personas?",
        [
          "Utilizar un lenguaje y estilo de escritura muy formal en los correos electrónicos.",
          "Crear correos electrónicos y sitios web que se parecen mucho a los de entidades legítimas",
          "Enviar correos electrónicos desde direcciones de remitente obviamente falsas."
        ],
        1
      ],
      [
        2,
        "¿Qué describe mejor una estafa en internet?",
        [
          "Un algoritmo matemático utilizado para cifrar mensajes secretos en la web oscura.",
          "Son fraudes en línea abarcan una amplia gama de engaños perpetrados en el ciberespacio con el objetivo de estafar a las personas.",
          "Una estrategia de marketing viral utilizada por empresas poco éticas."
        ],
        1
      ],
      [
        2,
        "¿Cómo puedes detectar una estafa en internet?",
        [
          "Ofertas Demasiadas Buenas para Ser Ciertas",
          "Solicitudes de Dinero o Información Personal",
          "Perfiles Falsos o Anónimos",
          "Todas las anteriores"
        ],
        3
      ],
      [
        2,
        "¿En qué tipo de estafa en línea las víctimas pueden recibir correos electrónicos o mensajes afirmando que han ganado una lotería ficticia?",
        [
          "Estafas de lotería.",
          "Estafas de jardinería en línea.",
          "Estafas de reparto de pizzas virtuales."
        ],
        0
      ],
      [
        2,
        "¿Qué hacen los estafadores en las estafas románticas en línea?",
        [
          "Venden productos de belleza en línea.",
          "Crean perfiles falsos en sitios de citas o redes sociales y establecen relaciones sentimentales con las víctimas para luego pedir dinero.",
          "Ofrecen consejos de cocina."
        ],
        1
      ],
      [
        2,
        "¿Por qué los estafadores a menudo presionan a las víctimas para tomar decisiones rápidas?",
        [
          "Para que las víctimas envíen dinero de inmediato o proporcionen información personal sin pensar.",
          "Para organizar reuniones en línea.",
          "Para brindar tiempo a las víctimas para reflexionar sobre la situación."
        ],
        0
      ],
      [
        2,
        "¿Cuál de las siguientes acciones puede ayudar a protegerse de las estafas en línea?",
        [
          "Compartir información personal en línea de manera indiscriminada.",
          "Usar la misma contraseña para todas las cuentas en línea.",
          "Mantener la privacidad limitando la cantidad de datos personales compartidos en línea."
        ],
        2
      ],
      [
        2,
        "¿Qué deben hacer las víctimas si creen que han sido estafadas en línea?",
        [
          "Ignorar la estafa y esperar que se resuelva por sí sola.",
          "Denunciar la estafa a las autoridades y a las plataformas en las que se llevó a cabo.",
          "Enviar más dinero a los estafadores para intentar recuperar lo perdido."
        ],
        1
      ],
      [
        2,
        "¿Por qué las estafas en línea son un problema persistente?",
        [
          "Porque los estafadores aprovechan la conectividad y la relativa anonimidad de Internet para engañar a las personas.",
          "Debido a la falta de interés en las ofertas en línea.",
          "Porque las estafas en línea solo afectan a empresas,no a personas individuales."
        ],
        0
      ],
      [
        2,
        "¿Por qué las estafas en línea pueden ser particularmente crueles en comparación con otras estafas?",
        [
          "Porque explotan las emociones de las víctimas al establecer relaciones sentimentales falsas.",
          "Porque siempre devuelven el dinero robado después de cometer la estafa.",
          "Porque las estafas en línea nunca involucran emociones personales."
        ],
        0
      ],
      [
        3,
        "¿Qué tipo de información se considera datos personales?",
        [
          "Fotos de vacaciones en familia.",
          "Números de seguridad social, contraseñas, datos bancarios y otra información privada",
          "Nombres de restaurantes favoritos."
        ],
        1
      ],
      [
        3,
        "¿Por qué es crítico proteger los datos personales en la era digital?",
        [
          "Para prevenir el robo de identidad y otros delitos financieros.",
          "Para mantener la privacidad de las celebridades en línea.",
          "Para evitar que los amigos y familiares accedan a información personal."
        ],
        0
      ],
      [
        3,
        "¿Qué riesgo representa el acceso no autorizado a datos bancarios o tarjetas de crédito?",
        [
          "Beneficios financieros inesperados.",
          "Aumento de la calificación crediticia.",
          "Pérdidas financieras significativas."
        ],
        2
      ],
      [
        3,
        "¿Por qué es importante configurar ajustes de privacidad en línea?",
        [
          "Para controlar quién puede ver tu información.",
          "Para aumentar la visibilidad en línea.",
          "Para compartir información con desconocidos."
        ],
        0
      ],
      [
        3,
        "¿Qué es la autenticación de dos factores (2FA)?",
        [
          "Una contraseña que se comparte públicamente.",
          "Un método adicional de seguridad que requiere una segunda forma de verificación.",
          "Un método para evitar la autenticación."
        ],
        1
      ],
      [
        3,
        "¿Por qué se debe evitar compartir la ubicación en tiempo real en redes sociales?",
        [
          "Puede poner en riesgo tu seguridad.",
          "Para mantener a tus amigos informados sobre tus actividades.",
          "Para ganar premios en línea."
        ],
        0
      ],
      [
        3,
        "¿Por qué es importante educar a los niños sobre los riesgos en línea?",
        [
          "Para que pasen más tiempo en línea.",
          "Para que compartan información personal en línea sin restricciones.",
          "Para que comprendan la importancia de no compartir información personal y practicar el comportamiento en línea seguro."
        ],
        2
      ],
      [
        3,
        "¿Qué se debe hacer si recibes un mensaje de texto o correo electrónico sospechoso?",
        [
          "Hacer clic en enlaces sin dudar.",
          "Descargar todos los archivos adjuntos sin verificar.",
          "Ninguna de las anteriores"
        ],
        2
      ],
      [
        3,
        "¿Qué se recomienda hacer si crees que has sido víctima de robo de identidad?",
        [
          "Ignorar la situación y esperar a que se resuelva por sí sola.",
          "Informar a tus instituciones financieras y a las autoridades.",
          "No tomar ninguna acción."
        ],
        1
      ],
      [
        3,
        "¿Por qué es importante mantener registros de las comunicaciones relacionadas con el robo de identidad?",
        [
          "Para ganar espacio en tu correo electrónico.",
          "Para aumentar la cantidad de correos electrónicos.",
          "Para tener documentación importante en caso de necesitar pruebas."
        ],
        2
      ],
      [
        4,
        "¿Qué característica hace que una contraseña sea más segura?",
        [
          "Longitud de al menos 12 caracteres.",
          "Utilizar solo letras minúsculas.",
          "Incluir información personal en la contraseña."
        ],
        0
      ],
      [
        4,
        "¿Por qué es importante evitar contraseñas basadas en palabras comunes o datos personales?",
        [
          "Son fácilmente adivinadas.",
          "Son difíciles de recordar.",
          "Son recomendadas para la seguridad."
        ],
        0
      ],
      [
        4,
        "¿Cuál es una práctica recomendada al crear contraseñas sólidas?",
        [
          "Utilizar frases de contraseña.",
          "Usar nombres de familiares en la contraseña.",
          "Cambiar la contraseña cada semana."
        ],
        0
      ],
      [
        4,
        "¿Por qué se recomienda evitar información personal en las contraseñas?",
        [
          "Para prevenir que otros adivinen fácilmente la contraseña.",
          "Para personalizar la contraseña.",
          "Para recordar la contraseña más fácilmente."
        ],
        0
      ],
      [
        4,
        "¿Cuál es un componente esencial de la creación de contraseñas sólidas?",
        [
          "No utilizar la misma contraseña para múltiples cuentas.",
          "Cambiar la contraseña mensualmente.",
          "Compartir contraseñas con amigos."
        ],
        0
      ],
      [
        4,
        "¿Cuál de las siguientes NO es una forma común de autenticación de dos factores?",
        [
          "Una dirección de correo electrónico adicional.",
          "Un código de verificación en tiempo real.",
          "Una huella dactilar."
        ],
        0
      ],
      [
        4,
        "¿Qué ventaja ofrece un gestor de contraseñas en la generación de contraseñas?",
        [
          "Puede crear contraseñas fuertes y aleatorias para cada cuenta.",
          "Puede almacenar contraseñas en texto sin formato.",
          "No es útil para la creación de contraseñas."
        ],
        0
      ],
      [
        4,
        "¿Por qué es importante que los gestores de contraseñas almacenen contraseñas de manera segura y cifrada?",
        [
          "Para que sean inaccesibles para los atacantes.",
          "Para que sea más fácil para los atacantes acceder a las contraseñas.",
          "Para compartirlas públicamente."
        ],
        0
      ],
      [
        4,
        "¿Qué función puede realizar un gestor de contraseñas para facilitar el acceso seguro?",
        [
          "Autocompletar contraseñas en sitios web y aplicaciones.",
          "Almacenar contraseñas en papel.",
          "Enviar contraseñas por correo electrónico."
        ],
        0
      ],
      [
        4,
        "¿Por qué se recomienda utilizar un recordatorio para cambiar las contraseñas?",
        [
          "Para recordar cuándo es el momento de actualizar las contraseñas.",
          "Para olvidar completamente las contraseñas.",
          "Para evitar cambiar las contraseñas."
        ],
        0
      ],
      [
        5,
        "¿Por qué es importante mantener actualizado el software?",
        [
          "Para garantizar la seguridad de tus dispositivos y datos.",
          "Para aumentar el rendimiento del software.",
          "Para ahorrar dinero en actualizaciones."
        ],
        0
      ],
      [
        5,
        "¿Cuáles son los dos tipos principales de actualizaciones de software?",
        [
          "Actualizaciones automáticas y manuales.",
          "Actualizaciones de alto riesgo y bajo riesgo.",
          "Actualizaciones críticas y opcionales."
        ],
        0
      ],
      [
        5,
        "¿Cuál es la principal diferencia entre las actualizaciones automáticas y las manuales?",
        [
          "Las actualizaciones automáticas se instalan sin requerir la intervención del usuario,mientras que las actualizaciones manuales requieren la intervención del usuario.",
          "Las actualizaciones automáticas son opcionales, mientras que las actualizaciones manuales son obligatorias.",
          "Las actualizaciones automáticas solo son para el sistema operativo, y las actualizaciones manuales son solo para aplicaciones."
        ],
        0
      ],
      [
        5,
        "¿Qué elementos necesitas mantener actualizados para mantener un entorno seguro?",
        [
          "Sistema operativo, navegadores web, aplicaciones y programas.",
          "Solo el sistema operativo.",
          "Solo las aplicaciones de seguridad."
        ],
        0
      ],
      [
        5,
        "¿Qué son los parches de seguridad?",
        [
          "Actualizaciones específicas destinadas a corregir vulnerabilidades y agujeros de seguridad en el software existente.",
          "Actualizaciones generales del sistema operativo.",
          "Actualizaciones de funciones adicionales."
        ],
        0
      ],
      [
        5,
        "¿Qué tipo de problemas se resuelven mediante parches de seguridad de navegadores?",
        [
          "Problemas de seguridad que podrían permitir la ejecución de código malicioso.",
          "Problemas de rendimiento de navegadores.",
          "Problemas de compatibilidad de navegadores."
        ],
        0
      ],
      [
        5,
        "¿Por qué son esenciales los parches de seguridad?",
        [
          "Para cerrar vulnerabilidades y evitar ataques cibernéticos.",
          "Para mejorar el rendimiento del software.",
          "Para agregar nuevas funciones a las aplicaciones."
        ],
        0
      ],
      [
        5,
        "¿Qué deben hacer los desarrolladores de software en respuesta a amenazas conocidas o nuevas vulnerabilidades?",
        [
          "Lanzar parches de seguridad.",
          "Ignorar las amenazas y vulnerabilidades.",
          "Desarrollar nuevas versiones del software."
        ],
        0
      ],
      [
        5,
        "¿Por qué es importante que tanto el sistema operativo como las aplicaciones estén siempre actualizados?",
        [
          "Para protegerse contra amenazas en constante evolución.",
          "Para acelerar el rendimiento de los dispositivos.",
          "Para reducir la cantidad de espacio de almacenamiento utilizado."
        ],
        0
      ],
      [
        5,
        "¿Cuál es el objetivo principal de los parches de seguridad?",
        [
          "Cerrar brechas de seguridad y evitar ataques.",
          "Agregar nuevas características a las aplicaciones.",
          "Optimizar el rendimiento del software existente."
        ],
        0
      ],
      [
        6,
        "¿Cuál es la función principal de un firewall?",
        [
          "Actuar como una barrera contra amenazas externas y filtrar tráfico no autorizado.",
          "Mejorar la velocidad de la conexión a Internet.",
          "Eliminar el malware de tu dispositivo."
        ],
        0
      ],
      [
        6,
        "¿Qué tipo de amenazas se dirigen comúnmente con el software antivirus?",
        [
          "Malware, incluyendo virus, gusanos, troyanos y spyware.",
          "Correo no deseado (spam).",
          "Vulnerabilidades del sistema operativo."
        ],
        0
      ],
      [
        6,
        "¿Qué proporciona el software antivirus además de escanear y eliminar malware?",
        [
          "Protección en tiempo real al identificar y detener amenazas en el acto.",
          "Optimización del rendimiento del sistema.",
          "Acceso a Internet más rápido."
        ],
        0
      ],
      [
        6,
        "¿Qué indicador visual en la barra de direcciones de un navegador sugiere una conexión segura mediante HTTPS?",
        [
          "Un icono de candado.",
          "Un icono de impresora.",
          "Un icono de carrito de compras."
        ],
        0
      ],
      [
        6,
        "¿Por qué se deben evitar las descargas de sitios de torrents o fuentes no verificadas?",
        [
          "Porque son especialmente riesgosas y pueden contener malware.",
          "Porque son la única fuente segura para obtener software.",
          "Porque ofrecen descargas más rápidas que otras fuentes."
        ],
        0
      ],
      [
        6,
        "¿Qué medidas de seguridad se pueden aplicar a dispositivos móviles?",
        [
          "Actualizar el sistema operativo y habilitar el bloqueo de pantalla.",
          "Apagar los dispositivos móviles cuando no se usan.",
          "Enviar mensajes de texto seguros."
        ],
        0
      ],
      [
        6,
        "¿Por qué es importante descargar aplicaciones sólo desde fuentes confiables, como tiendas de aplicaciones oficiales?",
        [
          "Para reducir el riesgo de instalar aplicaciones maliciosas.",
          "Porque las aplicaciones de fuentes no verificadas son gratuitas.",
          "Porque las aplicaciones de fuentes no verificadas funcionan mejor."
        ],
        0
      ],
      [
        6,
        "¿Qué papel desempeña el cifrado en la protección de la privacidad en línea?",
        [
          "El cifrado protege tus datos sensibles y las conexiones mediante HTTPS.",
          "El cifrado acelera la velocidad de navegación en línea.",
          "El cifrado protege contra las descargas de malware."
        ],
        0
      ],
      [
        6,
        "¿Por qué es importante verificar la identidad antes de compartir información sensible en línea?",
        [
          "Para evitar la exposición de información a posibles estafadores.",
          "Para recibir premios y regalos en línea.",
          "Para agilizar la navegación en Internet."
        ],
        0
      ],
      [
        6,
        "¿Qué debes hacer si recibes un correo electrónico no solicitado con un enlace sospechoso?",
        [
          "No hagas clic en el enlace ni descargues archivos adjuntos.",
          "Haz clic en el enlace sin preocupaciones.",
          "Descarga archivos adjuntos sin abrirlos."
        ],
        0
      ],
      [
        6,
        "¿Por qué es importante educarse y aumentar la conciencia sobre la ingeniería social?",
        [
          "Para reconocer y evitar tácticas de estafadores y protegerse contra ataques.",
          "Para ganar premios y regalos en línea.",
          "Para navegar por Internet de manera más eficiente."
        ],
        0
      ],
      [
        6,
        "¿Qué medidas adicionales de seguridad son esenciales para la navegación segura en línea?",
        [
          "Utilizar conexiones seguras (HTTPS), evitar correos electrónicos sospechosos y cifrar datos sensibles.",
          "Compartir datos personales en línea con amigos y familiares.",
          "Descargar todos los archivos adjuntos de correos electrónicos."
        ],
        0
      ]
    ];
    //await _fetchProducts();

    print(questions);
  }

  // Future<void> _fetchProducts() async {
  //   print("entro a fetch products");
  //   String assetPath = 'lib/assets/JSON/security_questions.json';
  //   String jsonString = await rootBundle.loadString(assetPath);

  //   try {
  //     List<dynamic> jsonData = json.decode(jsonString);

  //     for (var sessionData in jsonData) {
  //       List section = [];
  //       section.add(sessionData['id']);
  //       section.add(sessionData['sessionTitle']);
  //       sections.add(section);

  //       for (var questionData in sessionData['questions']) {
  //         List question = [];
  //         question.add(questionData['sessionId']);
  //         question.add(questionData['question']);
  //         question.add(questionData['options']);
  //         question.add(questionData['correctAnswer']);

  //         questions.add(question);
  //       }
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
