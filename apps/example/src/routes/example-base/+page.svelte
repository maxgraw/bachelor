<script>
  import { onMount } from "svelte";

  onMount(async () => {
    await import("ar-player/test");
  });
</script>

<ar-element-test></ar-element-test>
