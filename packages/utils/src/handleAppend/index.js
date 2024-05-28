/**
 * Handle Append
 * @param {import("../type").Config} config
 * @param {import("../type").Intersection} data
 */
export function handleAppend(config, data) {
	config.appendSelected = data.object.userData.position;
}
