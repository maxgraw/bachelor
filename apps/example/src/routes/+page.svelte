<script>
import { onMount } from "svelte";

onMount(async () => {
	await import("player/interactive");
});
</script>

<div>
Playground
</div>

<ar-element-interactive>
  <ar-option model="one_one_center_scale.glb" name="1x1" id="17"></ar-option>
  <ar-option model="two_one_center_scale.glb" name="2x1" id="18"></ar-option>
</ar-element-interactive>

<style>
  :global(*) {
    margin: 0;
    padding: 0;
  }
</style>
