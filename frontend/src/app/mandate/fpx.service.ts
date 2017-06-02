import { Injectable } from '@angular/core';
import { Response } from '@angular/http';

@Injectable()
export class FpxService {

	constructor() { }

	processFpxRedirect(result: Response) {
		var form = document.createElement("form");
		form.setAttribute("method", "POST");
		form.setAttribute("action", result.headers.get("Location"));
		var fpxFormData = result.json();

		for (const key of Object.keys(fpxFormData)) {
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", key);
			hiddenField.setAttribute("value", fpxFormData[key]);
			form.appendChild(hiddenField);
		}

		document.body.appendChild(form);
		form.submit();
	}
}
