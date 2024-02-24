export function hit_test(renderer, frame) {
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

      this.cursor.visible = true;
      this.cursor.matrix.fromArray(
        hit.getPose(referenceSpace).transform.matrix
      );
    } else {
      this.cursor.visible = false;
    }
  }
}
