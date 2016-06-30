<master>
  

    <section class="bg-primary" id="contattaci">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Contattaci</h2>
                    <hr class="light">
                </div>
            </div>
            <div class="row search blue">
                <div class="col-sm-offset-2 col-sm-8">
                    <p>In questa sezione puoi contattarci per qualsiasi richiesta:</p>
					<form role="form" action="" method="post" class="contattaci-form">
                        <div class="form-group">
                            <div class="error-message nome">Il campo <strong>nome</strong> è vuoto oppure contiene caratteri errati</div>
                            <label class="sr-only" for="form-nome">Nome</label>
                            <input type="text" id="form-nome" class="form-nome form-control required" placeholder="Nome*..." name="form-nome">
                        </div>
                        <div class="form-group">
                            <div class="error-message cognome">Il campo <strong>cognome</strong> è vuoto oppure contiene caratteri errati</div>
                            <label class="sr-only" for="form-cognome">Cognome</label>
                            <input type="text" id="form-cognome" class="form-cognome form-control required" placeholder="Cognome*..." name="form-cognome">
                        </div>
                        <div class="form-group">
                            <div class="error-message email">Il campo <strong>e-mail</strong> è vuoto oppure contiene caratteri errati</div>
                            <label class="sr-only" for="form-email">Email</label>
                            <input type="text" id="form-email" class="form-email form-control required" placeholder="Email*..." name="form-email">
                        </div>
                        <div class="form-group">
                    		<textarea name="textarea-contattaci" rows="12" placeholder="Scrivi qui la tua richiesta..." class="textarea-contattaci form-control" id="textarea-domanda"></textarea>
                        </div>
                    	<button class="btn invia-contattaci" type="submit">Invia</button>
                    </form>
                </div><!-- /.col-md-8 -->            
            </div><!-- /.row -->
            </div>
    	</div>              
    </section>
