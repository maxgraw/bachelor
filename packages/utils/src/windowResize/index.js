/**
 * Handle window resize event
 */
export function windowResize() {
	this.camera.aspect = window.innerWidth / window.innerHeight;
	this.camera.updateProjectionMatrix();

	this.renderer.setSize(window.innerWidth, window.innerHeight);
}
