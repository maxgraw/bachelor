<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("player/interactive");
  });
</script>

<ar-element-interactive options="box.glb, box_second.glb"
></ar-element-interactive>

<style>
  :global(*) {
    margin: 0;
    padding: 0;
  }

  :global(button) {
    background-color: red;
  }
</style>
