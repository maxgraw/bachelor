import { hide } from "../hide";
import { show } from "../show";

function switchDisplay(display, config) {
	if (display) {
		show(config.cursor);
		hide(config.no_cursor);
		return;
	}

	show(config.no_cursor);
	hide(config.cursor);
}

export function hitTest(renderer, frame) {
	const referenceSpace = renderer.xr.getReferenceSpace();
	const session = renderer.xr.getSession();

	if (this.hitTestSourceRequested === false) {
		session.requestReferenceSpace("viewer").then((referenceSpace) => {
			session.requestHitTestSource({ space: referenceSpace }).then((source) => {
				this.hitTestSource = source;
			});
		});

		session.addEventListener("end", () => {
			this.hitTestSourceRequested = false;
			this.hitTestSource = null;
		});

		this.hitTestSourceRequested = true;
	}

	if (this.hitTestSource) {
		const hitTestResults = frame.getHitTestResults(this.hitTestSource);

		if (hitTestResults.length) {
			const hit = hitTestResults[0];

			switchDisplay(true, this);
			this.cursor.matrix.fromArray(
				hit.getPose(referenceSpace).transform.matrix,
			);
		} else {
			switchDisplay(false, this);
		}
	}
}
