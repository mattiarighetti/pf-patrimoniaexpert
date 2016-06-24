<master>
  <property name="page_title">@page_title;noquote@</property>
  <property name="context">@context;noquote@</property>

  <h3>Anagrafiche investitori</h3>
  <table>
    <tr>
      <td class="list-filter-pane" width="200px" valign="top">
	<form action="@base_url@">
	  <table>
	    <tr class="ricerca">
	      <td colspan="2" class="list-filter-header">Ricerca</td>
	    </tr>
	    <tr>
	      <td>
		<input class="input" type="text" value="@q;noquote@" name="q" id="ricerca"\
		       style="width:100%" />
	      </td>
	    </tr>
	    <tr>
	      <td>
		<center>
		  <input class="bot" type="submit" value="Cerca" />
		  <input class="bot" type="button" value="Reset" onClick="location.href='investitori-list';" />
		</center>
	      </td>
	    </tr>
	    <tr>
	      <listfilters name="investitori"></listfilters>
	      <td class="list-list-pane" valign="top">
    		<listtemplate name="investitori"></listtemplate>
	      </td>
	    </tr>
	  </table>
	</form>
      </td>
    </tr>
  </table>
