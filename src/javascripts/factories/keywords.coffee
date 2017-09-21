angular.module('mediMeet').factory 'Keywords', () ->

  @categories = ["Hospital/IT 4.0", "Medizintechnik 4.0", "Facility Management 4.0", "Klinische Prozesse 4.0"]
  @subcategories = ["Cloud/IT-Services/Big Data", "Mobile Anwendungen", "Daten-/Dokumentenaustausche", "Cyber-Security & Privacy", "Interoperabilität", "Assistenzsysteme", "Wartung und Service", "Usability", "IT-gestützte Instandhaltung", "IoT im Krankenhaus", "Blue/Green Hospital", "Supply-Chain-Management", "e-Health/Medical Apps", "Digitale Versorgungsplattform", "Qualitäts-/Leistungserfassung", "Integrierte Prozesse"]
  @keywords = ["IT-Services", "Digital Twin", "Big Data", "Connected Medical Devices", "Mobile Anwendungen/Mobile Devices", "Clinical Decision Support", "Daten- und Dokumentenaustausch", "Condition Monitoring", "Cyber-Security/IT-Sicherheit", "Telemedizin", "Safety/Funktionssicherheit", "personalisierte Medizin", "Datenschutz/Privacy", "elektronische Patientenakte (EPA)", "IT-gestützte Instandhaltung/Computerized Maintenance", "Medizingeräte/Medical Devices", "Internet of Things", "Cyber-physical-systems (CPS)", "Sustainability/Nachhaltigkeit", "Krankenhausinformationssystem (KIS)", "Green-/Blue-Hospital", "Predicitve Maintenance", "Supply-Chain-Management", "Processing", "Logistik", "Clinical Pathways/Behandlungspfade", "Interoperabilität", "Assistenzsysteme", "Wartung und Service", "Usability", "e-Health", "Medical Apps", "Clinical Unified Collaboration", "Qualitätsmanagement"]

  @relations = [
    {
      category: "Hospital/IT 4.0",
      description: "Steht für den Einsatz digitaler Technologien zum strukturierten und sicheren Austausch von Informationen u.a. über Krankenhausinformationssysteme.",
      subcategories: [
        {
          subcategory: "Cloud/IT-Services/Big Data",
          description: "Beschreibt die Bereitstellung von IT-Diensten wie digitale Infratruktur, Plattformen und  Software als Dienste über Modelle wie der Public oder Private Cloud.",
          keywords: ["Cloud", "IT-Services", "Big Data", "Internet of Things", "Cyber-Security/IT-Sicherheit", "Daten-und Dokumentenaustausch"]
        },
        {
          subcategory: "Mobile Anwendungen",
          description: "Bezeichnet die Verwendung mobiler Endgeräte (Smartphones, Tablets, ...) für verschiedenste  Anwendungen wie Bereitstellung oder Aufnahme relevanter Daten.",
          keywords: ["Medical Apps", "e-Health", "Connected Medical Devices", "elektronische Patientenakte (EPA)", "Krankenhausinformationssystem (KIS)"]
        },
        {
          subcategory: "Daten-/Dokumentenaustausche",
          description: "Steht für digitaliserte und standardisierte Erfassung und Dokumentation, um Übertragungsfehler und Informationsverlust zu vermeiden.",
          keywords: ["elektronische Patientenakte (EPA)", "Krankenhausinformationssystem (KIS)", "Qualitätsmanagement"]
        },
        {
          subcategory: "Cyber-Security & Privacy",
          description: "Beschreibt zum einen die Sicherheit der digitalen Systeme selbst und zum anderen die  Anforderungen an den Schutz der Patientendaten.",
          keywords: ["Cyber-Security/IT-Sicherheit", "Safety/Funktionssicherheit", "Datenschutz/Privacy Cloud"]
        }
      ]
    },
    {
      category: "Medizintechnik 4.0",
      description: "Beschreibt die Vernetzung von Medizingeräten, die ihre Daten weitergeben können und ihre Funktionen als digitalen Dienst über Schnittstellen bereitstellen.",
      subcategories: [
        {
          subcategory: "Interoperabilität",
          description: "Bezeichnet die Fähigkeit unabhängiger, heterogener Systeme hinsichtlich physischer oder virtueller Schnittstellen verwertbare Informationen auszutauschen.",
          keywords: ["Medizingeräte/Medical Devices", "Connected Medical Devices"]
        },
        {
          subcategory: "Assistenzsysteme",
          description: "Dienen der Unterstützung des Krankenhauspersonals in bestimmten Situationen und bei Abläufen, vom Monitoring bis zu klinischen Entscheidungen.",
          keywords: ["Cyber-physical-systems (CPS)"]
        },
        {
          subcategory: "Wartung und Service",
          description: "Mithilfe moderner IT erlauben neue Möglichkeiten wie Tele-Inspektion und prädiktive Instandhaltung, um Fehler und Ausfälle zu reduzieren.",
          keywords: ["Condition Monitoring", "Predicitve Maintenance"]
        },
        {
          subcategory: "Usability",
          description: "Bezeichnet die Bedienbarkeit von Geräten und erhält durch Vernetzung und Technologien wie Virtual und Augmented Reality ganz neue Möglichkeiten.",
          keywords: ["Connected Medical Devices", "Cyber-physical-systems (CPS)", "Telemedizin"]
        }
      ]
    },
    {
      category: "Facility Management 4.0",
      description: "Bezeichnet die Verwendung u.a. von Cloud- und IoT-Technologien bei der Wartung und Instandhaltung von Anlagen und Infrastruktur sowie der Logistik.",
      subcategories: [
        {
          subcategory: "IT-gestützte Instandhaltung",
          description: "Beschreibt, wie durch IT Anlagen und Infrastrukturen selbst für ihre Instandhaltung relevante Daten erfassen und so Wartungsbedarf selbst melden können.",
          keywords: ["Condition Monitoring", "Predicitve Maintenance", "Internet of Things", "Smart Device"]
        },
        {
          subcategory: "IoT im Krankenhaus",
          description: "Bezeichnet die Vernetzung bzw. Kommunikation von „Dingen“ bzw. Geräten, sogenannten „smart devices“, u.a. um Personen- oder Objekte zu lokalisieren.",
          keywords: ["Smart Devices", "Digital Twin", "Cloud", "elektronische Patienteakte", "connected medical device", "clinical decision support", "Telemedzin", "Cyber-physical-systems (CPS)"]
        },
        {
          subcategory: "Blue/Green Hospital",
          description: "Steht für mehr Nachhaltigkeit im Krankenhausbetrieb, nicht nur bzgl. Verbrauch an Energie und Waren, sondern auch bzgl. Personal- und Patientenzufriedenheit.",
          keywords: ["Nachhaltigkeit/Sustainability", "Supply-Chain-Management", "Clinical Pathways", "Internet of Things", "Qualitätsmanagement"]
        },
        {
          subcategory: "Supply-Chain-Management",
          description: "Bezeichnet den Ansatz, Wertschöpfungs- und Lieferketten ganzheitlich über Unternehmens- und Einrichtungsgrenzen hinweg zu organisieren und zu steuern.",
          keywords: ["Logistik", "Mobile Anwendungen/Mobile Devices", "Internet of Things", "Medical Apps", "Qualitätsmanagement", "Smart Devices"]
        }
      ]
    }
    {
      category: "Klinische Prozesse 4.0",
      description: "Steht für IT-gestützte klinische Prozesssysteme und Anwendungen, die administrative und gesundheitsversorgende Abläufe im Unternehmen Krankenhaus regeln.",
      subcategories: [
        {
          subcategory: "e-Health/Medical Apps",
          description: "Steht zum einen für die Digitalisierung im Gesundheitswesen und zum anderen medizinische Softwareprodukte für hauptsächlich mobile Endgeräte.",
          keywords: ["e-Health", "Medical Apps", "personalisierte Medizin", "elektronische Patientenakte (EPA)", "Telemedizin", "Smart Devices", "Internet of Things", "Datenschutz", "Usability"]
        },
        {
          subcategory: "Digitale Versorgungsplattform",
          description: "Versteht man die Integration verschiedener Kommunikationswege wie Audio- und Video- Konferenzen, virtuellen white boards etc. auf eine einheitliche Plattform.",
          keywords: ["IT-Service", "Daten- und Dokumentenaustausch", "Interoperabilität", "Usability", "Integrierte Prozesse" ,"Telemedizin"]
        },
        {
          subcategory: "Qualitäts-/Leistungserfassung",
          description: "Soll u.a. durch mobile Anwendungen zunehmend automatisiert erfolgen, um mehr Transparenz zu gewährleisten und Dokumentationslücken zu vermeiden.",
          keywords: ["Qualitätsmanagement", "Daten- und Dokumentenaustausch", "Datenschutz/Privacy", "elektronische Patientenakte (EPA)"]
        },
        {
          subcategory: "Integrierte Prozesse",
          description: "Sorgen für effektivere Behandlungsabläufe, indem automatisierte Vorgänge nicht einzeln betrachtet, sondern über gesamte Prozesse integriert werden.",
          keywords: ["Clinical Pathways/Behandlungspfade", "Krankenhausinformationssystem (KIS)", "Qualitätsmanagement"]
        }
      ]
    }
  ]

  return {
      categories: @categories,
      subcategories: @subcategories,
      keywords: @keywords,
      relations: @relations
  }

