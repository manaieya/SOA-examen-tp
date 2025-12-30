<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouvel Invité - Grand Opéra de Paris</title>
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
        
        .input-with-icon .form-control {
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
        
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
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
        
        .form-steps {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }
        
        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        
        .step-circle {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--burgundy-dark), var(--burgundy));
            border: 2px solid var(--gold-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gold-light);
            font-family: 'Cinzel', serif;
            font-size: 1.5rem;
            font-weight: bold;
            transition: all 0.3s;
        }
        
        .step.active .step-circle {
            background: linear-gradient(45deg, var(--gold-dark), var(--gold-primary));
            color: var(--velvet);
            transform: scale(1.1);
            box-shadow: 0 0 20px rgba(212, 175, 55, 0.4);
        }
        
        .step-label {
            color: var(--gold-light);
            font-family: 'Cinzel', serif;
            font-size: 0.9rem;
            text-align: center;
        }
        
        .error-alert {
            background: linear-gradient(145deg, rgba(128, 0, 32, 0.8), rgba(80, 0, 0, 0.8));
            border: 1px solid var(--gold-primary);
            color: var(--gold-light);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }
        
        @media (max-width: 768px) {
            .opera-card {
                padding: 1.5rem;
            }
            
            .header-section {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .form-steps {
                gap: 15px;
            }
            
            .step-circle {
                width: 50px;
                height: 50px;
                font-size: 1.2rem;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="opera-card">
            <!-- En-tête -->
            <div class="header-section">
                <div>
                    <h1 class="opera-header gold-text mb-2">
                        <i class="bi bi-person-plus-fill me-3"></i>
                        NOUVEL INVITÉ
                    </h1>
                    <p class="text-light mb-0">Ajouter un invité d'honneur à la soirée du Réveillon 2025</p>
                </div>
                <div>
                    <span class="guest-badge">
                        <i class="bi bi-ticket-perforated"></i>
                        Soirée Exceptionnelle
                    </span>
                </div>
            </div>
            
            <!-- Étapes -->
            <div class="form-steps">
                <div class="step active">
                    <div class="step-circle">1</div>
                    <div class="step-label">Informations<br>Personnelles</div>
                </div>
                <div class="step">
                    <div class="step-circle">2</div>
                    <div class="step-label">Confirmation<br>d'Enregistrement</div>
                </div>
            </div>
            
            <!-- Divider -->
            <div class="divider"></div>
            
            <!-- Messages d'erreur -->
            <c:if test="${not empty error}">
                <div class="error-alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                    ${error}
                </div>
            </c:if>
            
            <!-- Formulaire -->
            <form action="${pageContext.request.contextPath}/persons/add" method="post">
                <!-- Section Informations Personnelles -->
                <div class="form-section">
                    <h3 class="section-title">
                        <i class="bi bi-person-vcard me-2"></i>
                        INFORMATIONS PERSONNELLES
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
                                       placeholder="Ex: DUPONT">
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
                                       placeholder="Ex: Jean">
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
                        
                        <!-- Sexe -->
                        <div class="col-md-4">
                            <label class="form-label">
                                <i class="bi bi-gender-ambiguous me-2"></i>
                                Civilité
                                <span class="required-mark">*</span>
                            </label>
                            <div class="input-with-icon">
                                <i class="bi bi-gender-ambiguous input-icon"></i>
                                <select class="form-select" name="sexe" required  style="color: #000t;"  >
                                    <option value=""  style="padding-left: 10px;">Sélectionner...</option>
                                    <option value="M" ${person.sexe eq 'M' ? 'selected' : ''}style="color: #000;">Monsieur</option>
                                    <option value="F" ${person.sexe eq 'F' ? 'selected' : ''} style="color: #000;">Madame</option>
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
                                       placeholder="exemple@domain.com">
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
                                <i class="bi bi-music-note me-2"></i>
                                Type d'Invitation
                            </label>
                            <select class="form-select" disabled>
                                <option>Standard - Soirée Opéra</option>
                            </select>
                            <div class="form-help">Type d'invitation prédéfini pour cet événement</div>
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label">
                                <i class="bi bi-clock-history me-2"></i>
                                Heure d'Arrivée Recommandée
                            </label>
                            <select class="form-select" disabled>
                                <option>22h30 - 22h45</option>
                            </select>
                            <div class="form-help">Pour une expérience optimale</div>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <label class="form-label">
                            <i class="bi bi-chat-text me-2"></i>
                            Notes Spéciales (Optionnel)
                        </label>
                        <textarea class="form-control" rows="3" 
                                  placeholder="Allergies, besoins particuliers, préférences..."
                                  style="resize: none;"></textarea>
                        <div class="form-help">Informations importantes pour le service</div>
                    </div>
                </div>
                
                <!-- Divider -->
                <div class="divider"></div>
                
                <!-- Boutons d'action -->
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div class="text-light">
                        <i class="bi bi-shield-check gold-text me-2"></i>
                        <small>Vos données sont sécurisées et confidentielles</small>
                    </div>
                    
                    <div class="d-flex gap-3">
                        <a href="${pageContext.request.contextPath}/persons/list" 
                           class="btn btn-opera-secondary">
                            <i class="bi bi-x-circle me-2"></i>
                            Annuler
                        </a>
                        <button type="submit" class="btn btn-opera">
                            <i class="bi bi-check-circle me-2"></i>
                            Enregistrer l'Invité
                        </button>
                    </div>
                </div>
            </form>
            
            <!-- Divider -->
            <div class="divider mt-5"></div>
            
            <!-- Informations importantes -->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="p-4" style="background: rgba(26, 11, 46, 0.5); border-radius: 15px; border-left: 3px solid var(--gold-primary);">
                        <h5 class="gold-text mb-3">
                            <i class="bi bi-info-circle me-2"></i>
                            Informations Importantes
                        </h5>
                        <ul class="text-light" style="list-style: none; padding-left: 0;">
                            <li class="mb-2"><i class="bi bi-check-circle gold-text me-2"></i> Tenue de soirée exigée</li>
                            <li class="mb-2"><i class="bi bi-check-circle gold-text me-2"></i> Présentation obligatoire de la carte d'identité</li>
                            <li class="mb-2"><i class="bi bi-check-circle gold-text me-2"></i> Invitation nominative et non transférable</li>
                            <li><i class="bi bi-check-circle gold-text me-2"></i> Confirmation par email sous 24h</li>
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
        // Validation en temps réel
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const inputs = form.querySelectorAll('input[required], select[required]');
            
            // Animation des étapes
            const steps = document.querySelectorAll('.step');
            steps.forEach((step, index) => {
                step.style.opacity = '0';
                step.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    step.style.transition = 'opacity 0.5s, transform 0.5s';
                    step.style.opacity = '1';
                    step.style.transform = 'translateY(0)';
                }, index * 200);
            });
            
            // Validation des champs
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    if (!this.value.trim()) {
                        this.style.borderColor = '#ff6b6b';
                        this.style.boxShadow = '0 0 0 0.25rem rgba(255, 107, 107, 0.25)';
                    } else {
                        this.style.borderColor = 'var(--gold-primary)';
                        this.style.boxShadow = '';
                    }
                });
                
                input.addEventListener('input', function() {
                    if (this.value.trim()) {
                        this.style.borderColor = 'var(--gold-secondary)';
                        this.style.boxShadow = '0 0 0 0.25rem rgba(212, 175, 55, 0.25)';
                    }
                });
            });
            
            // Validation de l'âge
            const ageInput = document.querySelector('input[name="age"]');
            ageInput.addEventListener('change', function() {
                const age = parseInt(this.value);
                if (age < 18) {
                    this.style.borderColor = '#ff6b6b';
                    this.style.boxShadow = '0 0 0 0.25rem rgba(255, 107, 107, 0.25)';
                    alert('L\'âge minimum requis est de 18 ans pour cet événement.');
                }
            });
            
            // Validation du formulaire
            form.addEventListener('submit', function(e) {
                let isValid = true;
                const missingFields = [];
                
                inputs.forEach(input => {
                    if (!input.value.trim()) {
                        isValid = false;
                        input.style.borderColor = '#ff6b6b';
                        input.style.boxShadow = '0 0 0 0.25rem rgba(255, 107, 107, 0.25)';
                        missingFields.push(input.previousElementSibling?.textContent || 'Champ');
                    }
                });
                
                if (!isValid) {
                    e.preventDefault();
                    const errorMessage = `Veuillez remplir les champs obligatoires : ${missingFields.join(', ')}`;
                    
                    // Afficher message d'erreur
                    const errorDiv = document.createElement('div');
                    errorDiv.className = 'error-alert';
                    errorDiv.innerHTML = `
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        ${errorMessage}
                    `;
                    
                    const existingError = document.querySelector('.error-alert');
                    if (existingError) {
                        existingError.remove();
                    }
                    
                    form.insertBefore(errorDiv, form.firstChild);
                    
                    // Scroll vers l'erreur
                    errorDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
                } else {
                    // Animation de succès
                    const submitBtn = form.querySelector('button[type="submit"]');
                    submitBtn.innerHTML = `
                        <i class="bi bi-hourglass-split me-2"></i>
                        Enregistrement en cours...
                    `;
                    submitBtn.disabled = true;
                    
                    // Simuler un délai d'enregistrement
                    setTimeout(() => {
                        submitBtn.innerHTML = `
                            <i class="bi bi-check-circle me-2"></i>
                            Invité enregistré avec succès !
                        `;
                        submitBtn.style.background = 'linear-gradient(145deg, #28a745, #218838)';
                    }, 1500);
                }
            });
            
            // Effet de focus sur les champs
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'translateY(-2px)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'translateY(0)';
                });
            });
        });
    </script>
</body>
</html>