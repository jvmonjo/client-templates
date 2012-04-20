{*

    Credit Card processing screen.
    Logged in customer can provide credit card details, or use current credit card on file to pay for invoice

*}{if $ccprocessed}

{else}
 <form action='' method='post' onsubmit="$('#ccpcontent').addLoader()">
    <input type="hidden" name="invoice_id" value="{$invoice_id}" />
    <input type="hidden" name="payment_module" value="{$payment_module}" />
	<input type="hidden" name="client[client_id]" value="{$cadetails.id}" />

<div class="wbox">
  	<div class="wbox_header">
	<strong>{$lang.ccarddetails}</strong></div>
	<div class="wbox_content" id="ccpcontent">
	<table  width="100%" cellpadding="0" cellspacing="0"  class="table table-striped">
            <tr><td colspan="2"  class="even"><input type="radio" name="cc_details" value="existing" {if !$ccard}disabled="disabled" /> {$lang.ccardexists} {else} checked="checked"  onclick="$('#newcard').hide();" /> {$lang.ccardexists} ({$ccard.cardnum}){/if}</td></tr>
            <tr class="even">
			<td colspan="2"><input type="radio" name="cc_details" value="new" {if !$ccard}checked="checked"{/if} onclick="$('#newcard').show();"/> {$lang.ccardnew}</td></tr>
			<tbody id="newcard" {if $ccard}style="display:none"{/if}>
                <tr><td align="right" width="160" >{$lang.ccardtype}</td><td>
                    <select name="cc[cardtype]">
                         {foreach from=$supportedcc item=cc}
                             <option>{$cc}</option>
                        {/foreach}
                    </select>
                </td></tr>
                <tr><td align="right">{$lang.ccardnum}</td><td><input type="text" name="cc[cardnum]" size="25" maxlenght="16"  class="styled"  autocomplete="off"/></td></tr>
                <tr><td align="right">{$lang.ccardexp}</td>
                    <td><input type="text" name="cc[expirymonth]" size="2" maxlength="2" class="styled" />/
                    <input type="text" name="cc[expiryyear]" size="2" maxlength="2"  class="styled"/> (MM/YY)</td></tr>
                <tr><td align="right">{$lang.autosave_cc}</td><td align="left"><input type="checkbox" value="1" name="save_cc" {if !$ccard}checked="checked"{/if} /> {$lang.autosave_cc_desc}</td></tr>

			</tbody>
                <tr><td align="right" width="160">{$lang.ccarcvv}</td><td align="left"><input type="text" name="cvv" size="4"  class="styled" autocomplete="off"/> <a href="{$template_dir}images/cvv.gif" target="_blank">?</a></td></tr>
                
	<tr class="even"><td colspan="2" align="center"><input type="submit" value="{$lang.continue}" name="continue"  class="btn btn-info" style="font-weight:bold"/></td></tr>

                </table>
	
</div>
</div>	

<div class="wbox">
  	<div class="wbox_header">
	<strong>{$lang.yourinfo}</strong></div>
	<div class="wbox_content">
	 <table cellpadding="0" cellspacing="0" border="0"  class="table table-striped" width="100%">
    <tbody>
	
    <tr><td align="right" width="160">{$lang.firstname}</td><td  >
    <input name="client[firstname]" value="{$cadetails.firstname}" class="styled"/></td></tr>

    <tr  class="even"><td align="right">{$lang.lastname}</td><td  >
    <input name="client[lastname]" value="{$cadetails.lastname}"  class="styled"/></td></tr>

    <tr><td align="right">{$lang.company}</td><td  >
    <input name="client[companyname]" value="{$cadetails.companyname}"  class="styled"/></td></tr>

    <tr  class="even"><td align="right">{$lang.email}</td><td  >
    <input name="client[email]" value="{$cadetails.email}"  class="styled"/></td></tr>

    <tr><td align="right">{$lang.address}</td><td  >
    <input name="client[address1]" value="{$cadetails.address1}"  class="styled"/></td></tr>

    <tr class="even"><td align="right">{$lang.address2}</td><td  >
    <input name="client[address2]" value="{$cadetails.address2}"  class="styled"/></td></tr>

    <tr><td align="right">{$lang.city}</td><td  >
    <input name="client[city]" value="{$cadetails.city}"  class="styled"/></td></tr>

    <tr class="even"><td align="right">{$lang.state}</td><td  >
    <input name="client[state]" value="{$cadetails.state}"  class="styled"/></td></tr>

    <tr><td align="right">{$lang.postcode}</td><td  >
    <input name="client[postcode]" value="{$cadetails.postcode}"  class="styled"/></td></tr>

    <tr class="even"><td align="right">{$lang.country}</td><td  >
    <select name="client[country]">
            {foreach from=$countries key=k item=v}
                    <option value="{$k}" {if $k==$cadetails.country} selected="Selected"{/if}>{$v}</option>

            {/foreach}
    </select></td></tr>

    <tr><td align="right">{$lang.phone}</td><td  >
    <input name="client[phonenumber]" value="{$cadetails.phonenumber}"  class="styled"/></td></tr>

    </tbody></table>
	
</div>
</div>	
     {securitytoken}</form>
{/if}