<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier un Invité - Grand Opéra de Paris</title>
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
        
        .divider {
            height: 2px;
            background: linear-gradient(90deg, 
                transparent, 
                var(--gold-primary) 20%, 
                var(--burgundy) 50%, 
                var(--gold-primary) 80%, 
                transparent);
            margin: 30px 0;
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
        
        /* Form Styling */
        .form-label {
            color: var(--gold-light);
            font-weight: bold;
            margin-bottom: 8px;
            font-family: 'Cinzel', serif;
            letter-spacing: 1px;
        }
        
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.08) !important;
            border: 1px solid var(--gold-primary) !important;
            color: var(--ivory) !important;
            border-radius: 10px !important;
            padding: 12px 16px !important;
            transition: all 0.3s !important;
        }
        
        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.12) !important;
            border-color: var(--gold-secondary) !important;
            box-shadow: 
                0 0 0 0.25rem rgba(212, 175, 55, 0.25),
                inset 0 0 20px rgba(212, 175, 55, 0.1) !important;
            color: var(--ivory) !important;
            transform: translateY(-2px);
        }
        
        .form-control::placeholder {
            color: rgba(245, 240, 230, 0.5) !important;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gold-primary);
            font-size: 1.2rem;
            z-index: 10;
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-with-icon .form-control,
        .input-with-icon .form-select {
            padding-left: 50px !important;
        }
        
        .form-section {
            background: rgba(26, 11, 46, 0.4);
            border-radius: 15px;
            padding: 25px;
            border: 1px solid rgba(212, 175, 55, 0.2);
            margin-bottom: 30px;
        }
        
        .section-title {
            font-family: 'Cinzel', serif;
            color: var(--gold-primary);
            border-bottom: 2px solid var(--gold-primary);
            padding-bottom: 10px;
            margin-bottom: 25px;
            font-size: 1.4rem;
        }
        
        .required-mark {
            color: #ff6b6b;
            margin-left: 4px;
        }
        
        .form-help {
            color: rgba(212, 175, 55, 0.7);
            font-size: 0.85rem;
            margin-top: 5px;
            font-style: italic;
        }
        
        .error-alert {
            background: linear-gradient(145deg, rgba(128, 0, 32, 0.8), rgba(80, 0, 0, 0.8));
            border: 1px solid var(--gold-primary);
            color: var(--gold-light);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        
        .success-alert {
            background: linear-gradient(145deg, rgba(33, 136, 56, 0.8), rgba(20, 86, 38, 0.8));
            border: 1px solid var(--gold-primary);
            color: var(--gold-light);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        
        .guest-badge {
            background: linear-gradient(45deg, var(--burgundy), var(--burgundy-dark));
            color: var(--gold-light);
            padding: 8px 16px;
            border-radius: 20px;
            font-family: 'Cinzel', serif;
            font-size: 0.9rem;
            border: 1px solid var(--gold-primary);
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .guest-id {
            background: linear-gradient(45deg, var(--velvet-light), var(--velvet));
            color: var(--gold-light);
            padding: 6px 14px;
            border-radius: 15px;
            font-family: 'Cinzel', serif;
            font-size: 0.8rem;
            border: 1px solid var(--gold-primary);
        }
        
        /* Styles pour le menu de civilité */
        .form-select option {
            background-color: var(--ivory) !important;
            color: var(--charcoal) !important;
            padding: 12px 16px !important;
        }
        
        .form-select option:first-child {
            color: rgba(10, 10, 10, 0.6) !important;
        }
        
        .form-select option:hover {
            background-color: var(--gold-primary) !important;
        }
        
        @media (max-width: 768px) {
            .opera-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="opera-card">
            <!-- En-tête -->
            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                <div>
                    <h1 class="opera-header gold-text mb-2">
                        <i class="bi bi-pencil-square me-3"></i>
                        MODIFIER L'INVITÉ
                    </h1>
                    <p class="text-light mb-0">Mettre à jour les informations de l'invité via API REST</p>
                </div>
                <div class="d-flex gap-3">
                    <c:if test="${not empty person}">
                        <span class="guest-id">
                            <i class="bi bi-person-badge me-2"></i>
                            ID: ${person.id}
                        </span>
                    </c:if>
                    <span class="guest-badge">
                        <i class="bi bi-ticket-perforated"></i>
                        Soirée Exceptionnelle
                    </span>
                </div>
            </div>
            
            <!-- Divider -->
            <div class="divider"></div>
            
            <!-- Messages -->
            <c:if test="${not empty error}">
                <div class="error-alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                </div>
            </c:if>
            
            <c:if test="${not empty success}">
                <div class="success-alert">
                    <i class="bi bi-check-circle-fill me-2"></i>
                    ${success}
                </div>
            </c:if>
            
            <c:if test="${empty person}">
                <div class="error-alert">
                    <i class="bi bi-person-x-fill me-2"></i>
                    Invité non trouvé !
                </div>
                <div class="text-center mt-4">
                    <a href="${pageContext.request.contextPath}/persons/list" class="btn btn-opera">
                        <i class="bi bi-arrow-left me-2"></i>
                        Retour à la liste
                    </a>
                </div>
            </c:if>
            
            <c:if test="${not empty person}">
                <form action="${pageContext.request.contextPath}/persons/update" method="post" class="mt-4" id="editForm">
                    <input type="hidden" name="id" value="${person.id}">
                    
                    <!-- Section Informations Personnelles -->
                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="bi bi-person-vcard me-2"></i>
                            MODIFICATION DES INFORMATIONS
                        </h3>
                        
                        <div class="row g-4">
                            <!-- Nom -->
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="bi bi-person-badge me-2"></i>
                                    Nom de Famille
                                    <span class="required-mark">*</span>
                                </label>
                                <div class="input-with-icon">
                                    <i class="bi bi-person-badge input-icon"></i>
                                    <input type="text" class="form-control" name="nom" 
                                           value="${person.nom}" required
                                           placeholder="Ex: DUPONT" maxlength="50">
                                </div>
                                <div class="form-help">Nom de famille tel qu'il apparaîtra sur l'invitation</div>
                            </div>
                            
                            <!-- Prénom -->
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="bi bi-person me-2"></i>
                                    Prénom
                                    <span class="required-mark">*</span>
                                </label>
                                <div class="input-with-icon">
                                    <i class="bi bi-person input-icon"></i>
                                    <input type="text" class="form-control" name="prenom" 
                                           value="${person.prenom}" required
                                           placeholder="Ex: Jean" maxlength="50">
                                </div>
                                <div class="form-help">Prénom de l'invité</div>
                            </div>
                            
                            <!-- Âge -->
                            <div class="col-md-4">
                                <label class="form-label">
                                    <i class="bi bi-calendar3 me-2"></i>
                                    Âge
                                    <span class="required-mark">*</span>
                                </label>
                                <div class="input-with-icon">
                                    <i class="bi bi-calendar3 input-icon"></i>
                                    <input type="number" class="form-control" name="age" 
                                           value="${person.age}" min="18" max="120" required
                                           placeholder="18">
                                </div>
                                <div class="form-help">Âge minimum: 18 ans</div>
                            </div>
                            
                            <!-- Civilité -->
                            <div class="col-md-4">
                                <label class="form-label">
                                    <i class="bi bi-gender-ambiguous me-2"></i>
                                    Civilité
                                    <span class="required-mark">*</span>
                                </label>
                                <div class="input-with-icon">
                                    <i class="bi bi-gender-ambiguous input-icon"></i>
                                    <select class="form-select civility-select" name="sexe" required>
                                        <option value="">Sélectionner...</option>
                                        <option value="M" ${person.sexe eq 'M' ? 'selected' : ''}>Monsieur</option>
                                        <option value="F" ${person.sexe eq 'F' ? 'selected' : ''}>Madame</option>
                                    </select>
                                </div>
                                <div class="form-help">Pour la formalité d'accueil</div>
                            </div>
                            
                            <!-- Email -->
                            <div class="col-md-4">
                                <label class="form-label">
                                    <i class="bi bi-envelope me-2"></i>
                                    Adresse Email
                                    <span class="required-mark">*</span>
                                </label>
                                <div class="input-with-icon">
                                    <i class="bi bi-envelope input-icon"></i>
                                    <input type="email" class="form-control" name="email" 
                                           value="${person.email}" required
                                           placeholder="exemple@domain.com" maxlength="100">
                                </div>
                                <div class="form-help">Pour l'envoi de l'invitation électronique</div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Section Informations Supplémentaires -->
                    <div class="form-section">
                        <h3 class="section-title">
                            <i class="bi bi-info-circle me-2"></i>
                            INFORMATIONS SUPPLÉMENTAIRES
                        </h3>
                        
                        <div class="row g-4">
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="bi bi-calendar-check me-2"></i>
                                    Type d'Invitation
                                </label>
                                <input type="text" class="form-control" disabled 
                                       value="${person.age >= 40 ? 'INVITÉ VIP' : 'INVITÉ STANDARD'}">
                                <div class="form-help">Statut basé sur l'âge de l'invité</div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label">
                                    <i class="bi bi-arrow-clockwise me-2"></i>
                                    Statut
                                </label>
                                <input type="text" class="form-control" disabled 
                                       value="ACTIF - Prêt pour la soirée">
                                <div class="form-help">Invitation activée et confirmée</div>
                            </div>
                        </div>
                        
                        <div class="mt-4">
                            <label class="form-label">
                                <i class="bi bi-chat-text me-2"></i>
                                Notes de Modification (Optionnel)
                            </label>
                            <textarea class="form-control" rows="3" name="notes"
                                      placeholder="Raison de la modification, informations importantes à noter..."
                                      style="resize: none;"></textarea>
                            <div class="form-help">Ces notes seront conservées dans l'historique</div>
                        </div>
                    </div>
                    
                    <!-- Divider -->
                    <div class="divider"></div>
                    
                    <!-- Boutons d'action -->
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <div class="text-light">
                            <i class="bi bi-shield-check gold-text me-2"></i>
                            <small>Les modifications sont sécurisées via API REST</small>
                        </div>
                        
                        <div class="d-flex gap-3">
                            <a href="${pageContext.request.contextPath}/persons/list" 
                               class="btn btn-opera-secondary">
                                <i class="bi bi-x-circle me-2"></i>
                                Annuler
                            </a>
                            <button type="submit" class="btn btn-opera" id="submitBtn">
                                <i class="bi bi-check-circle me-2"></i>
                                Mettre à jour l'Invité
                            </button>
                        </div>
                    </div>
                </form>
            </c:if>
            
            <!-- Divider -->
            <div class="divider mt-5"></div>
            
            <!-- Informations importantes -->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="p-4" style="background: rgba(26, 11, 46, 0.5); border-radius: 15px; border-left: 3px solid var(--gold-primary);">
                        <h5 class="gold-text mb-3">
                            <i class="bi bi-info-circle me-2"></i>
                            Instructions de Modification
                        </h5>
                        <ul class="text-light" style="list-style: none; padding-left: 0;">
                            <li class="mb-2"><i class="bi bi-pencil gold-text me-2"></i> Tous les champs marqués d'un * sont obligatoires</li>
                            <li class="mb-2"><i class="bi bi-clock-history gold-text me-2"></i> La modification sera effective immédiatement</li>
                            <li class="mb-2"><i class="bi bi-server gold-text me-2"></i> Données sauvegardées via API REST JAX-RS</li>
                            <li><i class="bi bi-archive gold-text me-2"></i> L'historique des modifications est conservé</li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="p-4" style="background: rgba(26, 11, 46, 0.5); border-radius: 15px; border-left: 3px solid var(--burgundy);">
                        <h5 class="gold-text mb-3">
                            <i class="bi bi-telephone me-2"></i>
                            Contact & Assistance
                        </h5>
                        <p class="text-light mb-2">
                            <i class="bi bi-envelope gold-text me-2"></i>
                            <strong>Email:</strong> assistance@opera-paris.fr
                        </p>
                        <p class="text-light mb-0">
                            <i class="bi bi-phone gold-text me-2"></i>
                            <strong>Téléphone:</strong> 01 40 01 19 70
                        </p>
                        <p class="text-muted mt-3 mb-0">
                            <small><i class="bi bi-clock-history me-1"></i> Service disponible du lundi au vendredi, 9h-18h</small>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Validation en temps réel
            const form = document.getElementById('editForm');
            const submitBtn = document.getElementById('submitBtn');
            
            if (form) {
                const inputs = form.querySelectorAll('input[required], select[required]');
                
                // Fonction de validation d'email
                function isValidEmail(email) {
                    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    return emailRegex.test(email);
                }
                
                // Validation individuelle des champs
                inputs.forEach(input => {
                    input.addEventListener('blur', function() {
                        validateField(this);
                    });
                    
                    input.addEventListener('input', function() {
                        // Réinitialiser l'état d'erreur pendant la saisie
                        if (this.value.trim()) {
                            this.style.borderColor = 'var(--gold-secondary)';
                            this.style.boxShadow = '0 0 0 0.25rem rgba(212, 175, 55, 0.25)';
                        }
                    });
                });
                
                // Fonction de validation d'un champ
                function validateField(field) {
                    const value = field.value.trim();
                    let isValid = true;
                    let errorMessage = '';
                    
                    if (!value) {
                        isValid = false;
                        errorMessage = 'Ce champ est obligatoire';
                    } else if (field.type === 'email' && !isValidEmail(value)) {
                        isValid = false;
                        errorMessage = 'Format d\'email invalide';
                    } else if (field.name === 'age') {
                        const age = parseInt(value);
                        if (isNaN(age) || age < 18 || age > 120) {
                            isValid = false;
                            errorMessage = 'Âge doit être entre 18 et 120 ans';
                        }
                    } else if ((field.name === 'nom' || field.name === 'prenom') && value.length > 50) {
                        isValid = false;
                        errorMessage = 'Maximum 50 caractères';
                    } else if (field.name === 'email' && value.length > 100) {
                        isValid = false;
                        errorMessage = 'Maximum 100 caractères';
                    }
                    
                    // Mise à jour de l'apparence du champ
                    if (!isValid) {
                        field.style.borderColor = '#ff6b6b';
                        field.style.boxShadow = '0 0 0 0.25rem rgba(255, 107, 107, 0.25)';
                        
                        // Afficher le message d'erreur
                        const errorSpan = document.createElement('span');
                        errorSpan.className = 'form-help text-danger';
                        errorSpan.textContent = errorMessage;
                        
                        // Supprimer l'ancien message d'erreur
                        const parent = field.closest('.col-md-6, .col-md-4');
                        const oldError = parent.querySelector('.text-danger');
                        if (oldError) oldError.remove();
                        
                        // Ajouter après le champ
                        const helpDiv = parent.querySelector('.form-help');
                        if (helpDiv) {
                            helpDiv.after(errorSpan);
                        }
                    } else {
                        field.style.borderColor = 'var(--gold-primary)';
                        field.style.boxShadow = '';
                        
                        // Supprimer le message d'erreur
                        const parent = field.closest('.col-md-6, .col-md-4');
                        const oldError = parent.querySelector('.text-danger');
                        if (oldError) oldError.remove();
                    }
                    
                    return isValid;
                }
                
                // Validation du formulaire à la soumission
                form.addEventListener('submit', function(e) {
                    e.preventDefault();
                    
                    let allValid = true;
                    const errorMessages = [];
                    
                    // Valider tous les champs
                    inputs.forEach(input => {
                        if (!validateField(input)) {
                            allValid = false;
                            
                            // Obtenir le label du champ
                            const label = input.closest('.col-md-6, .col-md-4')?.querySelector('.form-label');
                            if (label) {
                                const labelText = label.textContent.replace(/[★*✱✳✴✦✧]/g, '').trim();
                                const errorSpan = input.closest('.col-md-6, .col-md-4')?.querySelector('.text-danger');
                                if (errorSpan) {
                                    errorMessages.push(`${labelText}: ${errorSpan.textContent}`);
                                }
                            }
                        }
                    });
                    
                    // Validation supplémentaire pour l'âge
                    const ageInput = form.querySelector('input[name="age"]');
                    if (ageInput && ageInput.value) {
                        const age = parseInt(ageInput.value);
                        if (age < 18) {
                            allValid = false;
                            if (!errorMessages.includes('Âge: Âge doit être entre 18 et 120 ans')) {
                                errorMessages.push('Âge: L\'âge minimum requis est de 18 ans');
                            }
                        }
                    }
                    
                    if (!allValid) {
                        // Afficher les erreurs globales
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'error-alert';
                        errorDiv.innerHTML = `
                            <i class="bi bi-exclamation-triangle-fill me-2"></i>
                            <strong>Des erreurs ont été détectées :</strong><br>
                            <ul style="margin: 10px 0 0 20px; padding-left: 0;">
                                ${errorMessages.map(msg => `<li>${msg}</li>`).join('')}
                            </ul>
                        `;
                        
                        // Supprimer les anciennes alertes
                        const existingAlerts = document.querySelectorAll('.error-alert, .success-alert');
                        existingAlerts.forEach(alert => alert.remove());
                        
                        // Insérer la nouvelle alerte
                        const divider = document.querySelector('.divider');
                        if (divider) {
                            divider.after(errorDiv);
                        }
                        
                        // Scroll vers la première erreur
                        const firstError = form.querySelector('input[style*="border-color: #ff6b6b"], select[style*="border-color: #ff6b6b"]');
                        if (firstError) {
                            firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
                            firstError.focus();
                        }
                    } else {
                        // Désactiver le bouton et montrer l'indicateur de chargement
                        submitBtn.disabled = true;
                        submitBtn.innerHTML = `
                            <i class="bi bi-hourglass-split me-2"></i>
                            Mise à jour en cours...
                        `;
                        submitBtn.style.background = 'linear-gradient(145deg, var(--burgundy-dark), var(--velvet))';
                        
                        // Soumettre le formulaire après un délai pour l'effet visuel
                        setTimeout(() => {
                            // Réactiver le bouton avec succès visuel
                            submitBtn.innerHTML = `
                                <i class="bi bi-check-circle me-2"></i>
                                Invité mis à jour !
                            `;
                            submitBtn.style.background = 'linear-gradient(145deg, #28a745, #218838)';
                            
                            // Soumettre le formulaire
                            form.submit();
                        }, 1500);
                    }
                });
                
                // Réinitialiser le bouton lors de la modification des champs
                form.addEventListener('input', function() {
                    if (submitBtn.disabled) {
                        submitBtn.disabled = false;
                        submitBtn.innerHTML = `
                            <i class="bi bi-check-circle me-2"></i>
                            Mettre à jour l'Invité
                        `;
                        submitBtn.style.background = '';
                    }
                });
            }
            
            // Animation d'entrée des champs
            const formSections = document.querySelectorAll('.form-section');
            formSections.forEach((section, index) => {
                section.style.opacity = '0';
                section.style.transform = 'translateY(20px)';
                
                setTimeout(() => {
                    section.style.transition = 'opacity 0.6s, transform 0.6s';
                    section.style.opacity = '1';
                    section.style.transform = 'translateY(0)';
                }, index * 200);
            });
            
            // Gestion du sélecteur de civilité
            const civilitySelect = document.querySelector('.civility-select');
            if (civilitySelect) {
                civilitySelect.addEventListener('change', function() {
                    if (this.value) {
                        this.style.color = 'var(--ivory)';
                    } else {
                        this.style.color = 'rgba(245, 240, 230, 0.5)';
                    }
                });
                
                // Initialiser la couleur
                if (civilitySelect.value) {
                    civilitySelect.style.color = 'var(--ivory)';
                } else {
                    civilitySelect.style.color = 'rgba(245, 240, 230, 0.5)';
                }
            }
        });
    </script>
</body>
</html>