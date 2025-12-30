<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grand Opéra de Paris - Liste des Invités</title>
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
            max-width: 1400px;
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
        
        .search-form {
            background: rgba(26, 11, 46, 0.7);
            border: 1px solid var(--gold-primary);
            border-radius: 50px;
            padding: 0;
            overflow: hidden;
            max-width: 400px;
            margin: 0 auto;
        }
        
        .search-input {
            background: transparent;
            border: none;
            color: var(--ivory);
            padding: 12px 20px;
            width: 100%;
            font-family: 'Playfair Display', serif;
        }
        
        .search-input:focus {
            outline: none;
            box-shadow: none;
        }
        
        .search-input::placeholder {
            color: rgba(245, 240, 230, 0.6);
        }
        
        .search-btn {
            background: linear-gradient(45deg, var(--gold-dark), var(--gold-primary));
            border: none;
            color: var(--velvet);
            padding: 12px 25px;
            border-radius: 0 50px 50px 0;
            font-family: 'Cinzel', serif;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
            white-space: nowrap;
        }
        
        .search-btn:hover {
            background: linear-gradient(45deg, var(--gold-primary), var(--gold-secondary));
            transform: translateX(2px);
        }
        
        .clear-search-btn {
            background: linear-gradient(45deg, var(--burgundy-light), var(--burgundy));
            color: var(--gold-light);
            border: 1px solid var(--burgundy-light);
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            transition: all 0.3s;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }
        
        .clear-search-btn:hover {
            background: linear-gradient(45deg, var(--burgundy), var(--burgundy-dark));
            transform: translateY(-2px);
        }
        
        .divider {
            height: 2px;
            background: linear-gradient(90deg, 
                transparent, 
                var(--gold-primary) 20%, 
                var(--burgundy) 50%, 
                var(--gold-primary) 80%, 
                transparent);
            margin: 30px 0;
        }
        
        /* Table Styling */
        .opera-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            border-radius: 15px;
            overflow: hidden;
            background: rgba(26, 11, 46, 0.6);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
        }
        
        .opera-table thead {
            background: linear-gradient(90deg, 
                var(--burgundy-dark), 
                var(--burgundy));
        }
        
        .opera-table th {
            color: var(--gold-light);
            font-family: 'Cinzel', serif;
            font-weight: 700;
            padding: 18px 15px;
            border-bottom: 2px solid var(--gold-primary);
            text-transform: uppercase;
            letter-spacing: 1px;
            font-size: 0.9rem;
        }
        
        .opera-table tbody tr {
            background: rgba(255, 255, 255, 0.03);
            transition: all 0.3s;
        }
        
        .opera-table tbody tr:nth-child(even) {
            background: rgba(255, 255, 255, 0.05);
        }
        
        .opera-table tbody tr:hover {
            background: rgba(212, 175, 55, 0.1);
            transform: translateX(5px);
        }
        
        .opera-table td {
            padding: 16px 15px;
            color: var(--ivory);
            border-bottom: 1px solid rgba(212, 175, 55, 0.1);
            vertical-align: middle;
        }
        
        /* Badges */
        .badge-vip {
            background: linear-gradient(45deg, var(--gold-dark), var(--gold-primary));
            color: var(--velvet);
            padding: 6px 14px;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: bold;
            letter-spacing: 1px;
            border: 1px solid var(--gold-secondary);
            white-space: nowrap;
            display: inline-flex;
            align-items: center;
        }
        
        .badge-standard {
            background: linear-gradient(45deg, var(--burgundy-light), var(--burgundy));
            color: var(--gold-light);
            padding: 6px 14px;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: bold;
            letter-spacing: 1px;
            border: 1px solid var(--burgundy-light);
            white-space: nowrap;
            display: inline-flex;
            align-items: center;
        }
        
        /* Boutons d'action - CORRIGÉS POUR L'ALIGNEMENT */
        .action-btn {
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: bold;
            transition: all 0.3s;
            border: none;
            margin: 3px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-width: 90px;
            height: 38px;
            text-decoration: none;
            text-align: center;
            line-height: 1;
        }
        
        .btn-view {
            background: linear-gradient(45deg, #2D1B4E, #1A0B2E);
            color: var(--gold-light);
            border: 1px solid var(--gold-primary);
        }
        
        .btn-edit {
            background: linear-gradient(45deg, #B8860B, #D4AF37);
            color: var(--velvet);
            border: 1px solid var(--gold-secondary);
        }
        
        .btn-delete {
            background: linear-gradient(45deg, #800020, #500000);
            color: var(--gold-light);
            border: 1px solid var(--burgundy-light);
        }
        
        .btn-view:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3); }
        .btn-edit:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(184, 134, 11, 0.3); }
        .btn-delete:hover { transform: translateY(-2px); box-shadow: 0 5px 15px rgba(128, 0, 32, 0.3); }
        
        /* Modal personnalisé */
        .custom-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            backdrop-filter: blur(5px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
        }
        
        .modal-content-opera {
            background: linear-gradient(165deg, 
                rgba(26, 11, 46, 0.98), 
                rgba(10, 10, 10, 0.98));
            border: 2px solid var(--gold-primary);
            border-radius: 25px;
            padding: 2.5rem;
            max-width: 500px;
            width: 90%;
            box-shadow: 
                0 30px 70px rgba(0, 0, 0, 0.8),
                0 0 50px rgba(212, 175, 55, 0.3);
            animation: modalAppear 0.4s ease-out;
        }
        
        @keyframes modalAppear {
            from {
                opacity: 0;
                transform: translateY(-30px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }
        
        .modal-icon {
            font-size: 4rem;
            color: var(--gold-primary);
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .modal-title {
            font-family: 'Cinzel', serif;
            color: var(--gold-primary);
            text-align: center;
            margin-bottom: 1.5rem;
            font-size: 1.5rem;
        }
        
        .modal-message {
            color: var(--ivory);
            text-align: center;
            margin-bottom: 2rem;
            line-height: 1.6;
        }
        
        .modal-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .modal-btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-family: 'Cinzel', serif;
            font-weight: bold;
            border: none;
            cursor: pointer;
            transition: all 0.3s;
            min-width: 120px;
        }
        
        .modal-btn-cancel {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.8), 
                rgba(10, 10, 10, 0.8));
            color: var(--gold-light);
            border: 1px solid var(--gold-primary);
        }
        
        .modal-btn-confirm {
            background: linear-gradient(145deg, 
                var(--burgundy), 
                var(--burgundy-dark));
            color: var(--gold-light);
            border: 1px solid var(--gold-primary);
        }
        
        .modal-btn-cancel:hover {
            background: linear-gradient(145deg, 
                rgba(44, 11, 86, 0.9), 
                rgba(20, 20, 20, 0.9));
            transform: translateY(-2px);
        }
        
        .modal-btn-confirm:hover {
            background: linear-gradient(145deg, 
                var(--burgundy-dark), 
                var(--burgundy));
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(128, 0, 32, 0.5);
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            background: rgba(26, 11, 46, 0.5);
            border-radius: 15px;
            border: 2px dashed rgba(212, 175, 55, 0.3);
        }
        
        .empty-state i {
            font-size: 4rem;
            color: rgba(212, 175, 55, 0.5);
            margin-bottom: 20px;
        }
        
        .stats-card {
            background: linear-gradient(145deg, 
                rgba(26, 11, 46, 0.8), 
                rgba(10, 10, 10, 0.8));
            border-radius: 15px;
            padding: 20px;
            border: 1px solid var(--gold-primary);
            margin-bottom: 25px;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-family: 'Cinzel', serif;
            color: transparent;
            background: linear-gradient(45deg, 
                var(--gold-primary), 
                var(--gold-secondary));
            -webkit-background-clip: text;
            background-clip: text;
            line-height: 1;
        }
        
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .search-section {
            background: rgba(26, 11, 46, 0.6);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 25px;
            border: 1px solid rgba(212, 175, 55, 0.3);
        }
        
        @media (max-width: 768px) {
            .opera-card {
                padding: 1.5rem;
            }
            
            .header-section {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .opera-table {
                display: block;
                overflow-x: auto;
            }
            
            .action-btn {
                min-width: 80px;
                height: 35px;
                padding: 6px 12px;
                font-size: 0.8rem;
            }
            
            .search-form {
                max-width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Modal de confirmation personnalisé -->
    <div id="deleteModal" class="custom-modal">
        <div class="modal-content-opera">
            <div class="modal-icon">
                <i class="bi bi-exclamation-triangle-fill"></i>
            </div>
            <h3 class="modal-title">CONFIRMATION DE SUPPRESSION</h3>
            <div class="modal-message" id="modalMessage">
                Êtes-vous sûr de vouloir supprimer cet invité ?
            </div>
            <div class="modal-buttons">
                <button class="modal-btn modal-btn-cancel" onclick="closeModal()">
                    <i class="bi bi-x-circle me-2"></i>Annuler
                </button>
                <button class="modal-btn modal-btn-confirm" id="confirmDeleteBtn">
                    <i class="bi bi-trash-fill me-2"></i>Supprimer
                </button>
            </div>
        </div>
    </div>
    
    <div class="main-container">
        <div class="opera-card">
            <!-- En-tête -->
            <div class="header-section">
                <div>
                    <h1 class="opera-header gold-text mb-2">
                        <i class="bi bi-people-fill me-3"></i>
                        LISTE DES INVITÉS
                    </h1>
                    <p class="text-light mb-0">Gestion des invités d'honneur - Soirée du Réveillon 2025</p>
                </div>
                <div class="d-flex flex-wrap gap-3">
                    <a href="${pageContext.request.contextPath}/" class="btn btn-opera-secondary">
                        <i class="bi bi-house-door me-2"></i>Accueil
                    </a>
                    <a href="${pageContext.request.contextPath}/persons/add" class="btn btn-opera">
                        <i class="bi bi-person-plus me-2"></i>Nouvel Invité
                    </a>
                </div>
            </div>
            
            <!-- Section de recherche -->
            <div class="search-section">
                <div class="row align-items-center">
                    <div class="col-md-8">
                        <h5 class="gold-text mb-3">
                            <i class="bi bi-search me-2"></i>Rechercher un invité par ID
                        </h5>
                        <form action="${pageContext.request.contextPath}/persons/list" method="get" class="search-form">
                            <div class="d-flex">
                                <input type="number" 
                                       name="searchId" 
                                       class="search-input" 
                                       placeholder="Entrez l'ID de l'invité..."
                                       value="${searchId}"
                                       min="1"
                                       required>
                                <button type="submit" class="search-btn">
                                    <i class="bi bi-search me-2"></i>Rechercher
                                </button>
                            </div>
                        </form>
                        <c:if test="${searchPerformed}">
                            <div class="mt-3 d-flex align-items-center">
                                <i class="bi bi-info-circle gold-text me-2"></i>
                                <span class="text-light me-3">
                                    Recherche par ID: <strong class="gold-text">${searchId}</strong>
                                </span>
                                <a href="${pageContext.request.contextPath}/persons/list" class="clear-search-btn">
                                    <i class="bi bi-x-circle me-1"></i>Effacer la recherche
                                </a>
                            </div>
                        </c:if>
                    </div>
                    <div class="col-md-4 mt-3 mt-md-0 text-md-end">
                        <div class="text-light">
                            <i class="bi bi-info-circle gold-text me-2"></i>
                            <small>Recherche directe via l'API REST</small>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Statistiques -->
            <div class="stats-card">
                <div class="row text-center">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="stat-number">${empty persons ? '0' : persons.size()}</div>
                        <p class="text-light mb-0">Invités Totaux</p>
                    </div>
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="stat-number">
                            <c:set var="vipCount" value="0" />
                            <c:forEach var="person" items="${persons}">
                                <c:if test="${person.age >= 40}">
                                    <c:set var="vipCount" value="${vipCount + 1}" />
                                </c:if>
                            </c:forEach>
                            ${vipCount}
                        </div>
                        <p class="text-light mb-0">Invités VIP</p>
                    </div>
                    <div class="col-md-4">
                        <div class="stat-number">150</div>
                        <p class="text-light mb-0">Capacité Maximale</p>
                    </div>
                </div>
            </div>
            
            <c:if test="${not empty error}">
                <div class="alert alert-danger" style="background: var(--burgundy); border-color: var(--gold-primary); color: var(--gold-light);">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>${error}
                </div>
            </c:if>
            
            <!-- Divider -->
            <div class="divider"></div>
            
            <!-- Tableau des invités -->
            <c:choose>
                <c:when test="${not empty persons}">
                    <div class="table-responsive">
                        <table class="opera-table">
                            <thead>
                                <tr>
                                    <th style="width: 5%;">ID</th>
                                    <th style="width: 15%;">Nom</th>
                                    <th style="width: 15%;">Prénom</th>
                                    <th style="width: 8%;">Âge</th>
                                    <th style="width: 12%;">Statut</th>
                                    <th style="width: 22%;">Email</th>
                                    <th style="width: 23%;">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="person" items="${persons}">
                                    <tr>
                                        <td class="fw-bold gold-text">#${person.id}</td>
                                        <td class="fw-medium">${person.nom}</td>
                                        <td>${person.prenom}</td>
                                        <td>
                                            <span class="${person.age >= 40 ? 'badge-vip' : 'badge-standard'}">
                                                ${person.age} ans
                                            </span>
                                        </td>
                                        <td>
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
                                                    <span class="badge-standard">${person.sexe}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-envelope me-2 gold-text"></i>
                                                <span style="word-break: break-all;">${person.email}</span>
                                            </div>
                                        </td>
                                        <!-- Alternative : formulaire POST pour l'édition -->
										<td>
											<div class="d-flex flex-wrap gap-2">
												<!-- Bouton Voir -->
												<a
													href="${pageContext.request.contextPath}/persons/view/${person.id}"
													class="action-btn btn-view"> <i class="bi bi-eye me-1"></i>Voir
												</a>

												<!-- Bouton Modifier - POST avec paramètre id -->
												<form
													action="${pageContext.request.contextPath}/persons/edit"
													method="post" class="d-inline">
													<input type="hidden" name="id" value="${person.id}">
													<button type="submit" class="action-btn btn-edit">
														<i class="bi bi-pencil me-1"></i>Modifier
													</button>
												</form>

												<!-- Bouton Supprimer -->
												<button class="action-btn btn-delete delete-btn"
													data-person-id="${person.id}"
													data-person-name="${person.nom} ${person.prenom}">
													<i class="bi bi-trash me-1"></i>Supprimer
												</button>
											</div>
										</td>
									</tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    
                    <!-- Pied de tableau -->
                    <div class="d-flex justify-content-between align-items-center mt-4 pt-3 border-top border-secondary">
                        <div class="text-light">
                            <i class="bi bi-info-circle gold-text me-2"></i>
                            ${persons.size()} invité(s) trouvé(s)
                            <c:if test="${searchPerformed}">
                                <span class="ms-3">
                                    <i class="bi bi-filter gold-text me-1"></i>Résultat de recherche
                                </span>
                            </c:if>
                        </div>
                        <div class="d-flex gap-2">
                            <c:if test="${searchPerformed}">
                                <a href="${pageContext.request.contextPath}/persons/list" class="btn btn-opera-secondary">
                                    <i class="bi bi-list-ul me-2"></i>Voir tous
                                </a>
                            </c:if>
                            <button class="btn btn-opera-secondary" onclick="window.print()">
                                <i class="bi bi-printer me-2"></i>Imprimer
                            </button>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- État vide -->
                    <div class="empty-state">
                        <c:choose>
                            <c:when test="${searchPerformed}">
                                <i class="bi bi-search"></i>
                                <h3 class="gold-text mb-3">Aucun invité trouvé</h3>
                                <p class="text-light mb-4">Aucune personne correspondante à l'ID <strong class="gold-text">${searchId}</strong></p>
                                <div class="d-flex gap-3 justify-content-center">
                                    <a href="${pageContext.request.contextPath}/persons/list" class="btn btn-opera-secondary">
                                        <i class="bi bi-arrow-left me-2"></i>Retour à la liste
                                    </a>
                                    <a href="${pageContext.request.contextPath}/persons/add" class="btn btn-opera">
                                        <i class="bi bi-person-plus me-2"></i>Ajouter un invité
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <i class="bi bi-people"></i>
                                <h3 class="gold-text mb-3">Aucun invité trouvé</h3>
                                <p class="text-light mb-4">La liste des invités est actuellement vide. Ajoutez le premier invité pour commencer.</p>
                                <a href="${pageContext.request.contextPath}/persons/add" class="btn btn-opera">
                                    <i class="bi bi-person-plus me-2"></i>Ajouter le premier invité
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <!-- Divider -->
            <div class="divider mt-5"></div>
            
            <!-- Pied de page -->
            <div class="row mt-4 text-center">
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-shield-check gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Système sécurisé</p>
                            <small class="text-muted">Données cryptées et protégées</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3 mb-md-0">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-search gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Recherche avancée</p>
                            <small class="text-muted">Recherche par ID via API REST</small>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="d-flex align-items-center justify-content-center">
                        <i class="bi bi-clock-history gold-text me-3 fs-4"></i>
                        <div class="text-start">
                            <p class="text-light mb-1 fw-bold">Mis à jour en temps réel</p>
                            <small class="text-muted">Dernière actualisation: <span id="currentTime"></span></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Variables globales pour la suppression
        let currentDeleteUrl = '';
        
        // Fonctions pour le modal personnalisé
        function showModal(personName, deleteUrl) {
            currentDeleteUrl = deleteUrl;
            const modal = document.getElementById('deleteModal');
            const message = document.getElementById('modalMessage');
            
            message.innerHTML = `
                Êtes-vous sûr de vouloir supprimer <strong class="gold-text">${personName}</strong> de la liste des invités ?<br><br>
                <small class="text-muted">Cette action est irréversible et supprimera définitivement toutes les informations de cet invité.</small>
            `;
            
            modal.style.display = 'flex';
        }
        
        function closeModal() {
            document.getElementById('deleteModal').style.display = 'none';
            currentDeleteUrl = '';
        }
        
        function confirmDelete() {
            if (currentDeleteUrl) {
                window.location.href = currentDeleteUrl;
            }
        }
        
        // Mettre à jour l'heure actuelle
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString('fr-FR', {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit'
            });
            const dateString = now.toLocaleDateString('fr-FR', {
                weekday: 'long',
                year: 'numeric',
                month: 'long',
                day: 'numeric'
            });
            document.getElementById('currentTime').textContent = `${dateString} à ${timeString}`;
        }
        
        // Focus sur le champ de recherche
        function focusSearch() {
            const searchInput = document.querySelector('input[name="searchId"]');
            if (searchInput) {
                searchInput.focus();
            }
        }
        
        // Initialisation
        document.addEventListener('DOMContentLoaded', function() {
            // Mettre à jour l'heure
            updateTime();
            setInterval(updateTime, 1000);
            
            // Animation des lignes du tableau
            const rows = document.querySelectorAll('.opera-table tbody tr');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateX(-20px)';
                setTimeout(() => {
                    row.style.transition = 'opacity 0.5s, transform 0.5s';
                    row.style.opacity = '1';
                    row.style.transform = 'translateX(0)';
                }, index * 100);
            });
            
            // Gestion des boutons de suppression
            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const personId = this.getAttribute('data-person-id');
                    const personName = this.getAttribute('data-person-name');
                    const contextPath = '${pageContext.request.contextPath}';
                    const deleteUrl = contextPath + '/persons/delete/' + personId;
                    
                    showModal(personName, deleteUrl);
                });
            });
            
            // Confirmer la suppression
            document.getElementById('confirmDeleteBtn').addEventListener('click', confirmDelete);
            
            // Fermer le modal avec ESC
            document.addEventListener('keydown', function(e) {
                if (e.key === 'Escape') {
                    closeModal();
                }
            });
            
            // Fermer le modal en cliquant à l'extérieur
            document.getElementById('deleteModal').addEventListener('click', function(e) {
                if (e.target === this) {
                    closeModal();
                }
            });
            
            // Effet de survol pour les boutons d'action
            const actionButtons = document.querySelectorAll('.action-btn');
            actionButtons.forEach(btn => {
                btn.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-3px) scale(1.05)';
                });
                btn.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
            
            // Focus sur le champ de recherche si recherche effectuée
            <c:if test="${searchPerformed}">
                focusSearch();
            </c:if>
            
            // Validation du champ de recherche
            const searchForm = document.querySelector('.search-form');
            if (searchForm) {
                searchForm.addEventListener('submit', function(e) {
                    const searchInput = this.querySelector('input[name="searchId"]');
                    if (searchInput.value.trim() === '') {
                        e.preventDefault();
                        searchInput.focus();
                    }
                });
            }
        });
        
        // Raccourci clavier pour la recherche (Ctrl+F)
        document.addEventListener('keydown', function(e) {
            if ((e.ctrlKey || e.metaKey) && e.key === 'f') {
                e.preventDefault();
                focusSearch();
            }
        });
    </script>
</body>
</html>