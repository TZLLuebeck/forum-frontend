angular.module('mediMeet').factory 'Keywords', () ->

  @categories = ["Hospital/IT 4.0", "Medizintechnik 4.0", "Facility Management 4.0", "Klinische Prozesse 4.0"]
  @subcategories = ["Cloud/IT-Services/Big Data", "Mobile Anwendungen", "Daten-/Dokumentenaustausche", "Cyber-Security & Privacy", "Interoperabilität", "Assistenzsysteme", "Wartung und Service", "Usability", "IT-gestützte Instandhaltung", "IoT im Krankenhaus", "Blue/Green Hospital", "Supply-Chain-Management", "e-Health/Medical Apps", "Digitale Versorgungsplattform", "Qualitäts-/Leistungserfassung", "Integrierte Prozesse"]
  @keywords = ["IT-Services", "Digital Twin", "Big Data", "Connected Medical Devices", "Mobile Anwendungen/Mobile Devices", "Clinical Decision Support", "Daten- und Dokumentenaustausch", "Condition Monitoring", "Cyber-Security/IT-Sicherheit", "Telemedizin", "Safety/Funktionssicherheit", "personalisierte Medizin", "Datenschutz/Privacy", "elektronische Patientenakte (EPA)", "IT-gestützte Instandhaltung/Computerized Maintenance", "Medizingeräte/Medical Devices", "Internet of Things", "Cyber-physical-systems (CPS)", "Sustainability/Nachhaltigkeit", "Krankenhausinformationssystem (KIS)", "Green-/Blue-Hospital", "Predicitve Maintenance", "Supply-Chain-Management", "Processing", "Logistik", "Clinical Pathways/Behandlungspfade", "Interoperabilität", "Assistenzsysteme", "Wartung und Service", "Usability", "e-Health", "Medical Apps", "Clinical Unified Collaboration", "Qualitätsmanagement"]

  @relations = [
    {
      category: "Hospital/IT 4.0",
      subcategories: [
        {
          subcategory: "Cloud/IT-Services/Big Data",
          keywords: ["Cloud", "IT-Services", "Big Data", "Internet of Things", "Cyber-Security/IT-Sicherheit", "Daten-und Dokumentenaustausch"]
        },
        {
          subcategory: "Mobile Anwendungen",
          keywords: ["Mobile Anwendungen/Mobile Devices", "Medical Apps", "e-Health", "Connected Medical Devices", "elektronische Patientenakte (EPA)", "Krankenhausinformationssystem (KIS)"]
        },
        {
          subcategory: "Daten-/Dokumentenaustausche",
          keywords: ["Daten- und Dokumentenaustausch", "elektronische Patientenakte (EPA)", "Krankenhausinformationssystem (KIS)", "Qualitätsmanagement"]
        },
        {
          subcategory: "Cyber-Security & Privacy",
          keywords: ["Cyber-Security/IT-Sicherheit", "Safety/Funktionssicherheit", "Datenschutz/Privacy Cloud"]
        }
      ]
    },
    {
      category: "Medizintechnik 4.0",
      subcategories: [
        {
          subcategory: "Interoperabilität",
          keywords: ["Interoperabilität", "Medizingeräte/Medical Devices", "Connected Medical Devices"]
        },
        {
          subcategory: "Assistenzsysteme",
          keywords: ["Assistenzsysteme", "Cyber-physical-systems (CPS)"]
        },
        {
          subcategory: "Wartung und Service",
          keywords: ["Wartung und Service", "Condition Monitoring", "Predicitve Maintenance"]
        },
        {
          subcategory: "Usability",
          keywords: ["Usability", "Connected Medical Devices", "Cyber-physical-systems (CPS)", "Telemedizin"]
        }
      ]
    },
    {
      category: "Facility Management 4.0",
      subcategories: [
        {
          subcategory: "IT-gestützte Instandhaltung",
          keywords: ["IT-gestützte Instandhaltung/Computerized Maintenance", "Condition Monitoring", "Predicitve Maintenance", "Internet of Things", "Smart Device"]
        },
        {
          subcategory: "IoT im Krankenhaus",
          keywords: ["Internet of Things", "Smart Devices", "Digital Twin", "Cloud", "elektronische Patienteakte", "connected medical device", "clinical decision support", "Telemedzin", "Cyber-physical-systems (CPS)"]
        },
        {
          subcategory: "Blue/Green Hospital",
          keywords: ["Nachhaltigkeit/Sustainability", "Green-/Blue-Hospital", "Supply-Chain-Management", "Clinical Pathways", "Internet of Things", "Qualitätsmanagement"]
        },
        {
          subcategory: "Supply-Chain-Management",
          keywords: ["Supply-Chain-Management", "Logistik", "Mobile Anwendungen/Mobile Devices", "Internet of Things", "Medical Apps", "Qualitätsmanagement", "Smart Devices"]
        }
      ]
    }
    {
      category: "Klinische Prozesse 4.0",
      subcategories: [
        {
          subcategory: "e-Health/Medical Apps",
          keywords: ["e-Health", "Medical Apps", "personalisierte Medizin", "elektronische Patientenakte (EPA)", "Telemedizin", "Smart Devices", "Internet of Things", "Datenschutz", "Usability"]
        },
        {
          subcategory: "Digitale Versorgungsplattform",
          keywords: ["IT-Service", "Daten- und Dokumentenaustausch", "Interoperabilität", "Usability", "Integrierte Prozesse" ,"Telemedizin"]
        },
        {
          subcategory: "Qualitäts-/Leistungserfassung",
          keywords: ["Qualitätsmanagement", "Daten- und Dokumentenaustausch", "Datenschutz/Privacy", "elektronische Patientenakte (EPA)"]
        },
        {
          subcategory: "Integrierte Prozesse",
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

