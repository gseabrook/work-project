import { Observable } from 'rxjs';

export class DialogServiceMock {
	openConfirmationDialog() {
		return Observable.of(true);
	}

	openInputDialog() {
		return Observable.of("Input value");
	}
}