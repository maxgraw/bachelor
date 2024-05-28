/**
 * Get the type of object
 * @param {import("../type").Intersection} data
 * @returns {import("../type").TypeResult}
 */
export const getType = (data) => {
	const result = {
		selectable: false,
		ui: false,
		appendOptions: false,
	};

	if (data?.object?.userData?.isSelectable) {
		result.selectable = true;
	}

	if (data?.object?.userData?.isAdd) {
		result.appendOptions = true;
	}

	if (data?.object?.isUI) {
		result.ui = true;
	}

	return result;
};
