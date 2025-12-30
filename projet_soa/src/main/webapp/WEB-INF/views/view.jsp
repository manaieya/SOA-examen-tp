<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grand Opéra de Paris - Détails de l'Invité</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700;900&family=Playfair+Display:wght@400;700&display=swap" rel="stylesheet">
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
        
        .opera-header {
            font-family: 'Cinzel', serif;
            text-transform: uppercase;
            letter-spacing: 3px;
            font-weight: 900;
        }
        
        .gold-text {
            color: var(--gold-primary);
            text-shadow: 
                0 0 10px rgba(212, 175, 55, 0.5),
                0 0 20px rgba(212, 175, 55, 0.3);
        }
        
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem 1rem;
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
            padding: 2.5rem;
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
            padding: 12px 28px;
            border-radius: 50px;
            font-family: 'Cinzel', serif;
            font-weight: bold;
            letter-spacing: 1px;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            overflow: hidden;
            font-size: 1rem;
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
            transform: translateY(-4px) scale(1.05);
            box-shadow: 
                0 10px 25px rgba(128, 0, 32, 0.6),
                0 0 30px rgba(212, 175, 55, 0.4),
                inset 0 0 20px rgba(212, 175, 55, 0.2);
            color: var(--gold-secondary);
            border-color: var(--gold-secondary);
        }
        
        .btn-opera:hover::before {
            left: 100%;
        }
        
        .btn-opera-secondary {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.8), 
                rgba(10, 10, 10, 0.8));
            border: 1px solid var(--gold-primary);
            color: var(--gold-light);
            padding: 10px 24px;
            border-radius: 50px;
            font-family: 'Cinzel', serif;
            transition: all 0.3s;
        }
        
        .btn-opera-secondary:hover {
            background: linear-gradient(145deg, 
                rgba(44, 11, 86, 0.9), 
                rgba(20, 20, 20, 0.9));
            color: var(--gold-secondary);
            border-color: var(--gold-secondary);
            transform: translateY(-2px);
        }
        
        .detail-card {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.8), 
                rgba(10, 10, 10, 0.8));
            border-radius: 20px;
            border: 2px solid var(--gold-primary);
            padding: 2rem;
            margin-top: 2rem;
        }
        
        .detail-item {
            margin-bottom: 1.5rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid rgba(212, 175, 55, 0.2);
        }
        
        .detail-label {
            font-family: 'Cinzel', serif;
            color: var(--gold-primary);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
        }
        
        .detail-value {
            font-size: 1.2rem;
            color: var(--ivory);
        }
        
        .badge-vip {
            background: linear-gradient(45deg, var(--gold-dark), var(--gold-primary));
            color: var(--velvet);
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
            letter-spacing: 1px;
            border: 1px solid var(--gold-secondary);
            display: inline-block;
        }
        
        .badge-standard {
            background: linear-gradient(45deg, var(--burgundy-light), var(--burgundy));
            color: var(--gold-light);
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: bold;
            letter-spacing: 1px;
            border: 1px solid var(--burgundy-light);
            display: inline-block;
        }
        
        .person-id {
            font-size: 3rem;
            font-family: 'Cinzel', serif;
            color: transparent;
            background: linear-gradient(45deg, 
                var(--gold-primary), 
                var(--gold-secondary));
            -webkit-background-clip: text;
            background-clip: text;
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .person-name {
            font-family: 'Cinzel', serif;
            font-size: 2.5rem;
            text-align: center;
            margin-bottom: 2rem;
            color: var(--gold-primary);
        }
        
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }
        
        .info-section {
            background: rgba(26, 11, 46, 0.6);
            border-radius: 15px;
            padding: 1.5rem;
            border: 1px solid rgba(212, 175, 55, 0.3);
        }
        
        .info-title {
            font-family: 'Cinzel', serif;
            color: var(--gold-primary);
            font-size: 1.2rem;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 2px solid var(--gold-primary);
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
            border-bottom: 1px solid rgba(212, 175, 55, 0.1);
        }
        
        .info-label {
            color: var(--gold-light);
            font-weight: bold;
        }
        
        .info-value {
            color: var(--ivory);
        }
        
        @media (max-width: 768px) {
            .opera-card {
                padding: 1.5rem;
            }
            
            .person-name {
                font-size: 2rem;
            }
            
            .person-id {
                font-size: 2.5rem;
            }
            
            .info-grid {
                grid-template-columns: 1fr;
            }
        }
        
        .action-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 3rem;
            flex-wrap: wrap;
        }
        
        .btn-action {
            min-width: 150px;
            padding: 12px 25px;
            border-radius: 50px;
            font-family: 'Cinzel', serif;
            font-weight: bold;
            transition: all 0.3s;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .btn-edit {
            background: linear-gradient(45deg, var(--gold-dark), var(--gold-primary));
            color: var(--velvet);
            border: 1px solid var(--gold-secondary);
        }
        
        .btn-delete {
            background: linear-gradient(45deg, var(--burgundy), var(--burgundy-dark));
            color: var(--gold-light);
            border: 1px solid var(--burgundy-light);
        }
        
        .btn-back {
            background: linear-gradient(45deg, #2D1B4E, #1A0B2E);
            color: var(--gold-light);
            border: 1px solid var(--gold-primary);
        }
        
        .btn-edit:hover, .btn-delete:hover, .btn-back:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="opera-card">
            <!-- En-tête -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h1 class="opera-header gold-text mb-2">
                        <i class="bi bi-person-badge-fill me-3"></i>
                        DÉTAILS DE L'INVITÉ
                    </h1>
                    <p class="text-light mb-0">Informations complètes - Soirée du Réveillon 2025</p>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/persons/list" class="btn btn-opera-secondary">
                        <i class="bi bi-arrow-left me-2"></i>Retour à la liste
                    </a>
                </div>
            </div>
            
            <c:choose>
                <c:when test="${not empty person}">
                    <!-- Carte d'identité de l'invité -->
                    <div class="detail-card">
                        <!-- En-tête de la carte -->
                        <div class="text-center mb-4">
                            <div class="person-id">#${person.id}</div>
                            <h2 class="person-name">${person.nom} ${person.prenom}</h2>
                            <div class="mb-4">
                                <c:choose>
                                    <c:when test="${person.age >= 40}">
                                        <span class="badge-vip">
                                            <i class="bi bi-star-fill me-2"></i>INVITÉ VIP - ${person.age} ans
                                        </span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge-standard">
                                            <i class="bi bi-person-check me-2"></i>INVITÉ STANDARD - ${person.age} ans
                                        </span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        
                        <!-- Grille d'informations -->
                        <div class="info-grid">
                            <!-- Section Identité -->
                            <div class="info-section">
                                <div class="info-title">
                                    <i class="bi bi-person-vcard me-2"></i>IDENTITÉ
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Nom de famille:</span>
                                    <span class="info-value">${person.nom}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Prénom:</span>
                                    <span class="info-value">${person.prenom}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Âge:</span>
                                    <span class="info-value">${person.age} ans</span>
                                </div>
                            </div>
                            
                            <!-- Section Contact -->
                            <div class="info-section">
                                <div class="info-title">
                                    <i class="bi bi-envelope-paper me-2"></i>CONTACT
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Email:</span>
                                    <span class="info-value">${person.email}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Genre:</span>
                                    <span class="info-value">
                                        <c:choose>
                                            <c:when test="${person.sexe eq 'M'}">
                                                <span class="badge-standard">
                                                    <i class="bi bi-gender-male me-1"></i>Monsieur
                                                </span>
                                            </c:when>
                                            <c:when test="${person.sexe eq 'F'}">
                                                <span class="badge-standard" style="background: linear-gradient(45deg, #A05252, #800020);">
                                                    <i class="bi bi-gender-female me-1"></i>Madame
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                ${person.sexe}
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Statut:</span>
                                    <span class="info-value">
                                        <c:choose>
                                            <c:when test="${person.age >= 40}">
                                                <span class="gold-text">VIP (Senior)</span>
                                            </c:when>
                                            <c:otherwise>
                                                Standard
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                </div>
                            </div>
                            
                            <!-- Section Système -->
                            <div class="info-section">
                                <div class="info-title">
                                    <i class="bi bi-gear me-2"></i>INFORMATIONS SYSTÈME
                                </div>
                                <div class="info-row">
                                    <span class="info-label">ID Unique:</span>
                                    <span class="info-value gold-text">${person.id}</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Source:</span>
                                    <span class="info-value">API REST JAX-RS</span>
                                </div>
                                <div class="info-row">
                                    <span class="info-label">Date d'accès:</span>
                                    <span class="info-value">
                                        <script>
                                            document.write(new Date().toLocaleDateString('fr-FR', {
                                                weekday: 'long',
                                                year: 'numeric',
                                                month: 'long',
                                                day: 'numeric'
                                            }));
                                        </script>
                                    </span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Boutons d'action -->
                        <div class="action-buttons">
                            <a href="${pageContext.request.contextPath}/persons/edit?id=${person.id}" 
                               class="btn-action btn-edit">
                                <i class="bi bi-pencil-square"></i>
                                Modifier
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/persons/delete/${person.id}" 
                               class="btn-action btn-delete"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer l\\'invité ${person.nom} ${person.prenom} ?')">
                                <i class="bi bi-trash"></i>
                                Supprimer
                            </a>
                            
                            <a href="${pageContext.request.contextPath}/persons/list" 
                               class="btn-action btn-back">
                                <i class="bi bi-list-ul"></i>
                                Retour à la liste
                            </a>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Message d'erreur -->
                    <div class="detail-card text-center">
                        <div class="mb-4">
                            <i class="bi bi-person-x-fill gold-text" style="font-size: 5rem;"></i>
                        </div>
                        <h3 class="gold-text mb-3">INVITÉ NON TROUVÉ</h3>
                        <p class="text-light mb-4">
                            <c:choose>
                                <c:when test="${not empty error}">
                                    ${error}
                                </c:when>
                                <c:otherwise>
                                    L'invité demandé n'existe pas ou a été supprimé.
                                </c:otherwise>
                            </c:choose>
                        </p>
                        <div class="action-buttons justify-content-center">
                            <a href="${pageContext.request.contextPath}/persons/list" class="btn-action btn-back">
                                <i class="bi bi-arrow-left"></i>
                                Retour à la liste
                            </a>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <!-- Pied de page -->
            <div class="row mt-5 pt-4 border-top border-secondary text-center">
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-shield-check gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Données sécurisées</p>
                            <small class="text-muted">Via API REST JAX-RS</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-server gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Backend REST</p>
                            <small class="text-muted">Java EE / JAX-RS</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-clock-history gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Temps réel</p>
                            <small class="text-muted">Mis à jour instantanément</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Animation d'apparition
        document.addEventListener('DOMContentLoaded', function() {
            const detailCard = document.querySelector('.detail-card');
            if (detailCard) {
                detailCard.style.opacity = '0';
                detailCard.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    detailCard.style.transition = 'opacity 0.6s, transform 0.6s';
                    detailCard.style.opacity = '1';
                    detailCard.style.transform = 'translateY(0)';
                }, 300);
            }
        });
    </script>
</body>
</html>