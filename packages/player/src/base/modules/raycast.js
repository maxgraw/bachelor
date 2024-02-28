import * as THREE from "three";

/**
 * Raycast
 * @param {THREE.Raycaster} raycaster
 * @param {Array} element
 * @returns {object}
 */
export function raycast(raycaster, element) {
  return element.reduce((closestIntersection, obj) => {
    const intersection = raycaster.intersectObject(obj, true);

    if (!intersection[0]) return closestIntersection;

    if (
      !closestIntersection ||
      intersection[0].distance < closestIntersection.distance
    ) {
      intersection[0].object = obj;

      return intersection[0];
    }

    return closestIntersection;
  }, null);
}
