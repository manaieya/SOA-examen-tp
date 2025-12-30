<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grand Opéra de Paris - Système de Gestion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&family=Playfair+Display:wght@400;700&family=Dancing+Script:wght@600&display=swap" rel="stylesheet">
    <style>
        :root {
            --gold-primary: #D4AF37;
            --gold-secondary: #FFD700;
            --gold-light: #F5E8AA;
            --gold-dark: #B8860B;
            --burgundy: #800020;
            --burgundy-dark: #500000;
            --burgundy-light: #A05252;
            --velvet: #1A0B2E;
            --velvet-dark: #0F0519;
            --velvet-light: #2D1B4E;
            --ivory: #F5F0E6;
            --ivory-warm: #F8F4E6;
            --charcoal: #0A0A0A;
            --crystal: #E6F4F1;
        }
        
        body {
            background: linear-gradient(135deg, 
                var(--velvet-dark) 0%, 
                var(--velvet) 25%, 
                var(--burgundy-dark) 50%, 
                var(--velvet) 75%, 
                var(--velvet-dark) 100%);
            color: var(--ivory);
            min-height: 100vh;
            font-family: 'Playfair Display', serif;
            overflow-x: hidden;
            position: relative;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 20% 80%, rgba(212, 175, 55, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(128, 0, 32, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(26, 11, 46, 0.3) 0%, transparent 50%);
            z-index: -1;
        }
        
        body::after {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: 
                linear-gradient(90deg, transparent 95%, rgba(212, 175, 55, 0.03) 100%),
                linear-gradient(0deg, transparent 95%, rgba(212, 175, 55, 0.03) 100%);
            background-size: 50px 50px;
            z-index: -1;
            opacity: 0.3;
        }
        
        .opera-header {
            font-family: 'Cinzel', serif;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-weight: 900;
        }
        
        .signature-font {
            font-family: 'Dancing Script', cursive;
            font-size: 1.8rem;
        }
        
        .gold-text {
            color: var(--gold-primary);
            text-shadow: 
                0 0 10px rgba(212, 175, 55, 0.5),
                0 0 20px rgba(212, 175, 55, 0.3),
                0 0 30px rgba(212, 175, 55, 0.1);
            position: relative;
        }
        
        .gold-text::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 10%;
            width: 80%;
            height: 1px;
            background: linear-gradient(90deg, 
                transparent, 
                var(--gold-primary), 
                transparent);
        }
        
        .main-container {
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .opera-card {
            background: linear-gradient(165deg, 
                rgba(26, 11, 46, 0.95) 0%, 
                rgba(10, 10, 10, 0.95) 50%, 
                rgba(26, 11, 46, 0.95) 100%);
            backdrop-filter: blur(20px);
            border: 2px solid transparent;
            border-radius: 25px;
            box-shadow: 
                0 25px 60px rgba(0, 0, 0, 0.7),
                inset 0 1px 0 rgba(255, 255, 255, 0.1),
                0 0 0 1px rgba(212, 175, 55, 0.1);
            position: relative;
            overflow: hidden;
            margin: 2rem auto;
        }
        
        .opera-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(45deg, 
                transparent 0%, 
                rgba(212, 175, 55, 0.05) 45%, 
                rgba(128, 0, 32, 0.05) 55%, 
                transparent 100%);
            z-index: 0;
        }
        
        .opera-card > * {
            position: relative;
            z-index: 1;
        }
        
        .btn-opera {
            background: linear-gradient(145deg, 
                var(--burgundy), 
                var(--burgundy-dark) 70%,
                var(--burgundy));
            border: 1px solid var(--gold-primary);
            border-bottom: 3px solid var(--gold-dark);
            color: var(--gold-light);
            padding: 18px 40px;
            border-radius: 50px;
            font-family: 'Cinzel', serif;
            font-weight: bold;
            letter-spacing: 1.5px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            font-size: 1.1rem;
        }
        
        .btn-opera::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, 
                transparent, 
                rgba(212, 175, 55, 0.3), 
                transparent);
            transition: 0.6s;
        }
        
        .btn-opera:hover {
            transform: translateY(-6px) scale(1.05);
            box-shadow: 
                0 15px 30px rgba(128, 0, 32, 0.6),
                0 0 40px rgba(212, 175, 55, 0.4),
                inset 0 0 20px rgba(212, 175, 55, 0.2);
            color: var(--gold-secondary);
            border-color: var(--gold-secondary);
        }
        
        .btn-opera:hover::before {
            left: 100%;
        }
        
        .opera-icon {
            font-size: 6rem;
            color: transparent;
            background: linear-gradient(45deg, 
                var(--gold-primary), 
                var(--gold-secondary),
                var(--gold-light));
            -webkit-background-clip: text;
            background-clip: text;
            margin-bottom: 30px;
            filter: drop-shadow(0 0 20px rgba(212, 175, 55, 0.5));
            animation: float 4s ease-in-out infinite;
        }
        
        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            50% { transform: translateY(-15px) rotate(2deg); }
        }
        
        .feature-card {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.8), 
                rgba(10, 10, 10, 0.8));
            border-left: 4px solid var(--gold-primary);
            border-radius: 15px;
            padding: 25px;
            margin: 20px 0;
            transition: all 0.4s;
            border-top: 1px solid rgba(212, 175, 55, 0.2);
            border-right: 1px solid rgba(212, 175, 55, 0.1);
            border-bottom: 1px solid rgba(212, 175, 55, 0.1);
        }
        
        .feature-card:hover {
            transform: translateY(-8px) translateX(5px);
            background: linear-gradient(145deg, 
                rgba(44, 11, 86, 0.9), 
                rgba(20, 20, 20, 0.9));
            box-shadow: 
                0 15px 35px rgba(0, 0, 0, 0.5),
                0 0 30px rgba(212, 175, 55, 0.2);
            border-left: 4px solid var(--gold-secondary);
        }
        
        .divider {
            height: 2px;
            background: linear-gradient(90deg, 
                transparent, 
                var(--gold-primary) 20%, 
                var(--burgundy) 50%, 
                var(--gold-primary) 80%, 
                transparent);
            margin: 50px 0;
            position: relative;
        }
        
        .divider::before,
        .divider::after {
            content: '❖';
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gold-primary);
            font-size: 1.5rem;
        }
        
        .divider::before { left: 25%; }
        .divider::after { right: 25%; }
        
        .stat-number {
            font-size: 4rem;
            font-family: 'Cinzel', serif;
            color: transparent;
            background: linear-gradient(45deg, 
                var(--gold-primary), 
                var(--gold-secondary),
                var(--gold-light));
            -webkit-background-clip: text;
            background-clip: text;
            text-shadow: 0 0 20px rgba(212, 175, 55, 0.3);
            line-height: 1;
        }
        
        .ornament {
            font-size: 2rem;
            color: var(--gold-primary);
            margin: 0 15px;
            vertical-align: middle;
            display: inline-block;
            animation: spin 20s linear infinite;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .concert-date {
            background: linear-gradient(135deg, 
                rgba(128, 0, 32, 0.3), 
                rgba(26, 11, 46, 0.6));
            border-radius: 20px;
            padding: 25px;
            border: 1px solid var(--gold-primary);
            box-shadow: 
                inset 0 0 30px rgba(212, 175, 55, 0.1),
                0 10px 30px rgba(0, 0, 0, 0.4);
            position: relative;
            overflow: hidden;
        }
        
        .concert-date::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, 
                rgba(212, 175, 55, 0.1) 0%, 
                transparent 70%);
            animation: rotate 20s linear infinite;
        }
        
        @keyframes rotate {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .program-item {
            padding: 18px;
            margin: 12px 0;
            background: linear-gradient(145deg, 
                rgba(255, 255, 255, 0.03), 
                rgba(255, 255, 255, 0.01));
            border-radius: 12px;
            border-left: 4px solid transparent;
            transition: all 0.3s;
            border: 1px solid rgba(212, 175, 55, 0.1);
        }
        
        .program-item:hover {
            border-left: 4px solid var(--gold-primary);
            background: linear-gradient(145deg, 
                rgba(212, 175, 55, 0.1), 
                rgba(128, 0, 32, 0.05));
            transform: translateX(10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }
        
        .contact-info {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.9), 
                rgba(10, 10, 10, 0.9));
            border-radius: 20px;
            padding: 30px;
            border-top: 3px solid var(--gold-primary);
            box-shadow: 
                inset 0 0 40px rgba(212, 175, 55, 0.05),
                0 15px 35px rgba(0, 0, 0, 0.4);
        }
        
        .badge-opera {
            background: linear-gradient(45deg, 
                var(--burgundy), 
                var(--burgundy-dark));
            color: var(--gold-light);
            border: 1px solid var(--gold-primary);
            padding: 8px 16px;
            border-radius: 20px;
            font-family: 'Cinzel', serif;
            font-size: 0.9rem;
            letter-spacing: 1px;
            display: inline-block;    
   			margin: 4px;             
    		white-space: nowrap;     
        }
        
        .floating-note {
            position: absolute;
            color: rgba(212, 175, 55, 0.1);
            font-size: 8rem;
            z-index: 0;
        }
        
        .floating-note:nth-child(1) { top: 10%; left: 5%; }
        .floating-note:nth-child(2) { top: 20%; right: 8%; }
        .floating-note:nth-child(3) { bottom: 15%; left: 10%; }
        .floating-note:nth-child(4) { bottom: 25%; right: 15%; }
        
        .main-content {
            padding: 3rem 0;
        }
        
        .section-title {
            position: relative;
            display: inline-block;
            margin-bottom: 3rem;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, 
                var(--gold-primary), 
                var(--burgundy),
                var(--gold-primary));
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <!-- Notes musicales flottantes -->
    <div class="floating-note"><i class="bi bi-music-note-beamed"></i></div>
    <div class="floating-note"><i class="bi bi-music-note"></i></div>
    <div class="floating-note"><i class="bi bi-vinyl"></i></div>
    <div class="floating-note"><i class="bi bi-music-player"></i></div>
    
    <div class="main-container">
        <div class="main-content">
            <!-- En-tête majestueux -->
            <div class="text-center mb-5 px-3">
                <div class="opera-icon">
                    <i class="bi bi-music-note-beamed"></i>
                </div>
                <h1 class="opera-header gold-text display-1 fw-bold mb-3">
                    <span class="ornament">♚</span>
                    GRAND OPÉRA DE PARIS
                    <span class="ornament">♚</span>
                </h1>
                <p class="lead fs-3 text-light mb-4">Système Exclusif de Gestion des Invités d'Honneur</p>
                <div class="signature-font gold-text">L'Excellence depuis 1669</div>
            </div>
            
            <!-- Carte principale ÉLARGIE -->
            <div class="row justify-content-center mx-0">
                <div class="col-xxl-10 col-xl-11 col-lg-12 px-lg-4 px-3">
                    <div class="opera-card p-4 p-md-5 p-lg-5">
                        
                        <!-- Date du concert exceptionnel -->
                        <div class="concert-date text-center mb-5">
                            <div class="position-relative">
                                <h2 class="gold-text mb-4 fs-1">
                                    <i class="bi bi-stars me-3"></i>
                                    SOIRÉE DU RÉVEILLON 2025
                                    <i class="bi bi-stars ms-3"></i>
                                </h2>
                                <div class="row justify-content-center g-4">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="p-3">
                                            <h4 class="text-light mb-2"><i class="bi bi-calendar2-date me-2 gold-text"></i>Date</h4>
                                            <p class="fs-5 text-light">30 Décembre 2025</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-6">
                                        <div class="p-3">
                                            <h4 class="text-light mb-2"><i class="bi bi-clock-history me-2 gold-text"></i>Heure</h4>
                                            <p class="fs-5 text-light">23h00 - 00h00</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-12">
                                        <div class="p-3">
                                            <h4 class="text-light mb-2"><i class="bi bi-geo-alt me-2 gold-text"></i>Lieu</h4>
                                            <p class="fs-5 text-light">Palais Garnier, Paris</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Divider orné -->
                        <div class="divider"></div>
                        
                        <!-- Programme de la soirée -->
                        <div class="row mb-5 g-4">
                            <div class="col-lg-8">
                                <h3 class="section-title gold-text mb-4 opera-header">
                                    <i class="bi bi-music-note-list me-3"></i>
                                    PROGRAMME DE LA SOIRÉE
                                </h3>
                                <div class="program-item">
                                    <div class="d-flex align-items-start">
                                        <i class="bi bi-vinyl-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <h4 class="text-light mb-1">"La Flûte Enchantée" - Ouverture</h4>
                                            <p class="text-muted mb-0"><em>Wolfgang Amadeus Mozart</em></p>
                                            <p class="text-light mb-0 mt-2">Direction: Maestro Jean-Luc Delacroix</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="program-item">
                                    <div class="d-flex align-items-start">
                                        <i class="bi bi-vinyl-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <h4 class="text-light mb-1">"Habanera" de Carmen</h4>
                                            <p class="text-muted mb-0"><em>Georges Bizet</em></p>
                                            <p class="text-light mb-0 mt-2">Soprano: Isabelle Fontaine</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="program-item">
                                    <div class="d-flex align-items-start">
                                        <i class="bi bi-vinyl-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <h4 class="text-light mb-1">"Nessun Dorma" de Turandot</h4>
                                            <p class="text-muted mb-0"><em>Giacomo Puccini</em></p>
                                            <p class="text-light mb-0 mt-2">Ténor: Roberto Bellini</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="program-item">
                                    <div class="d-flex align-items-start">
                                        <i class="bi bi-vinyl-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <h4 class="text-light mb-1">"Libiamo ne' lieti calici" de La Traviata</h4>
                                            <p class="text-muted mb-0"><em>Giuseppe Verdi</em></p>
                                            <p class="text-light mb-0 mt-2">Ensemble complet du Grand Opéra</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-lg-4">
                                <div class="feature-card h-100">
                                    <h3 class="gold-text mb-4">
                                        <i class="bi bi-info-circle-fill me-2"></i> Information Importante
                                    </h3>
                                    <p class="text-light mb-4">
                                        Cette soirée exceptionnelle marque le passage à la nouvelle année 2026. 
                                        <br><br>
                                        <strong>Tenue de soirée strictement requise</strong>. Les portes ferment à 22h45 précises.
                                    </p>
                                    <div class="mt-4">
                                        <span class="badge-opera me-2 mb-2">VIP Lounge</span>
                                        <span class="badge-opera me-2 mb-2">Champagne Réserve</span>
                                        <span class="badge-opera me-2 mb-2">Sur Invitation</span>
                                        <span class="badge-opera mb-2">Coat Check</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Divider orné -->
                        <div class="divider"></div>
                        
                        <!-- Section gestion des invités -->
                        <div class="text-center mb-5">
                            <h3 class="section-title gold-text mb-4 opera-header">
                                <i class="bi bi-people-fill me-3"></i>
                                GESTION DES INVITÉS
                            </h3>
                            <p class="lead text-light mb-5 fs-4">
                                Système réservé à l'administration du Grand Opéra de Paris
                            </p>
                            
                            <div class="row justify-content-center g-5">
                                <div class="col-xl-5 col-lg-6">
                                    <div class="feature-card h-100">
                                        <div class="mb-4">
                                            <i class="bi bi-people display-3 gold-text"></i>
                                        </div>
                                        <h3 class="text-light mb-3">Liste des Invités</h3>
                                        <p class="text-muted mb-4 fs-5">Consultez la liste complète des invités d'honneur pour la soirée du Réveillon</p>
                                        <a href="${pageContext.request.contextPath}/persons/list" 
                                           class="btn btn-opera mt-2">
                                            <i class="bi bi-list-ul me-3"></i>
                                            Accéder à la Liste Complète
                                        </a>
                                    </div>
                                </div>
                                
                                <div class="col-xl-5 col-lg-6">
                                    <div class="feature-card h-100">
                                        <div class="mb-4">
                                            <i class="bi bi-person-plus display-3 gold-text"></i>
                                        </div>
                                        <h3 class="text-light mb-3">Nouvel Invité</h3>
                                        <p class="text-muted mb-4 fs-5">Ajouter un nouvel invité à cette soirée exceptionnelle</p>
                                        <a href="${pageContext.request.contextPath}/persons/add" 
                                           class="btn btn-opera mt-2">
                                            <i class="bi bi-plus-circle me-3"></i>
                                            Ajouter un Invité
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Divider orné -->
                        <div class="divider"></div>
                        
                        <!-- Statistiques -->
                        <div class="text-center mb-5">
                            <h3 class="section-title gold-text mb-4 opera-header">
                                <i class="bi bi-bar-chart-fill me-3"></i>
                                STATISTIQUES DE LA SOIRÉE
                            </h3>
                            <div class="row g-4">
                                <div class="col-lg-4 col-md-6">
                                    <div class="p-4 feature-card">
                                        <div class="stat-number" id="guestCount">${empty persons ? '0' : persons.size()}</div>
                                        <h4 class="text-light mt-3 mb-2">Invités Confirmés</h4>
                                        <p class="text-muted mb-0">Pour la soirée du Réveillon 2005</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="p-4 feature-card">
                                        <div class="stat-number">28</div>
                                        <h4 class="text-light mt-3 mb-2">Loges Privées</h4>
                                        <p class="text-muted mb-0">Exclusivement réservées aux VIP</p>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-12">
                                    <div class="p-4 feature-card">
                                        <div class="stat-number">150</div>
                                        <h4 class="text-light mt-3 mb-2">Capacité Totale</h4>
                                        <p class="text-muted mb-0">Placements numérotés et vérifiés</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Contact -->
                        <div class="contact-info mt-5">
                            <div class="row align-items-center">
                                <div class="col-lg-6 mb-4 mb-lg-0">
                                    <h3 class="gold-text mb-4">
                                        <i class="bi bi-telephone-outbound-fill me-3"></i> Contact & Assistance
                                    </h3>
                                    <div class="d-flex align-items-center mb-3">
                                        <i class="bi bi-envelope-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <p class="text-light mb-0 fs-5">manaieya33@gmail.com</p>
                                            <small class="text-muted">Réponse sous 24 heures</small>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-phone-fill me-3 gold-text fs-4"></i>
                                        <div>
                                            <p class="text-light mb-0 fs-5">+216 95 077 081</p>
                                            <small class="text-muted">Disponible 10h-18h</small>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <h3 class="gold-text mb-4">
                                        <i class="bi bi-info-square-fill me-3"></i> À Propos du Système
                                    </h3>
                                    <p class="text-light mb-3">
                                        Système développé exclusivement pour le Grand Opéra de Paris.
                                        Gestion sécurisée des invités pour les événements prestigieux.
                                    </p>
                                    <div class="d-flex align-items-center">
                                        <i class="bi bi-c-circle gold-text me-2"></i>
                                        <span class="text-muted">2025 Grand Opéra de Paris - Tous droits réservés</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    
                    <!-- Signature finale -->
                    <div class="text-center mt-5">
                        <p class="signature-font gold-text mb-2">L'Art à son apogée</p>
                        <small class="text-muted">
                            Palais Garnier • Place de l'Opéra • 75009 Paris • France
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Animation des statistiques avec effet de compteur
        document.addEventListener('DOMContentLoaded', function() {
            const guestCount = document.getElementById('guestCount');
            if(guestCount) {
                const target = parseInt(guestCount.textContent) || 0;
                animateCounter(guestCount, target, 2000);
            }
            
            // Effet d'apparition progressive des cartes
            const cards = document.querySelectorAll('.feature-card, .program-item');
            cards.forEach((card, index) => {
                card.style.opacity = '0';
                card.style.transform = 'translateY(30px) scale(0.95)';
                setTimeout(() => {
                    card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                    card.style.opacity = '1';
                    card.style.transform = 'translateY(0) scale(1)';
                }, index * 100 + 300);
            });
            
            // Effet de scintillement sur les éléments dorés
            const goldElements = document.querySelectorAll('.gold-text');
            goldElements.forEach((el, index) => {
                setInterval(() => {
                    el.style.filter = `drop-shadow(0 0 ${15 + Math.random() * 10}px rgba(212, 175, 55, ${0.4 + Math.random() * 0.3}))`;
                }, 1000 + index * 200);
            });
        });
        
        function animateCounter(element, target, duration) {
            let start = 0;
            const increment = target / (duration / 20);
            const timer = setInterval(() => {
                start += increment;
                if(start >= target) {
                    element.textContent = target;
                    clearInterval(timer);
                    // Effet de célébration
                    if(target > 0) {
                        element.style.transform = 'scale(1.2)';
                        setTimeout(() => {
                            element.style.transform = 'scale(1)';
                        }, 300);
                    }
                } else {
                    element.textContent = Math.floor(start);
                }
            }, 20);
        }
        
        // Effet de parallaxe sur le défilement
        window.addEventListener('scroll', function() {
            const scrolled = window.pageYOffset;
            const rate = scrolled * -0.5;
            document.querySelectorAll('.floating-note').forEach((note, index) => {
                note.style.transform = `translateY(${rate * (index + 1) * 0.1}px) rotate(${rate * 0.1}deg)`;
            });
        });
    </script>
</body>
</html>