<template>
  <button
    type="button"
    class="toggle-button"
    :class="{ active: value }"
    role="switch"
    :aria-checked="value.toString()"
    @click="onClick"
  >
    <span aria-hidden="true" :class="{ active: value }"></span>
  </button>
</template>

<script>
export default {
  props: {
    value: { type: Boolean, default: false },
  },
  methods: {
    onClick(event) {
      if (event.pointerId === -1) {
        event.preventDefault();
      } else {
        this.$emit('input', !this.value);
      }
    },
  },
};
</script>
<style lang="scss" scoped>
.toggle-button {
  --toggle-button-box-shadow: rgb(255, 255, 255) 0px 0px 0px 0px,
    rgba(59, 130, 246, 0.5) 0px 0px 0px 0px, rgba(0, 0, 0, 0.1) 0px 1px 3px 0px,
    rgba(0, 0, 0, 0.06) 0px 1px 2px 0px;
  background-color: var(--s-200);
  border-radius: var(--border-radius-large);
  border: 2px solid transparent;
  cursor: pointer;
  display: flex;
  flex-shrink: 0;
  height: 19px;
  position: relative;
  transition-duration: 200ms;
  transition-property: background-color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  width: 34px;

  &.active {
    background-color: var(--w-500);
  }

  span {
    --space-one-point-five: 1.5rem;
    background-color: var(--white);
    border-radius: 100%;
    box-shadow: var(--toggle-button-box-shadow);
    display: inline-block;
    height: var(--space-one-point-five);
    transform: translate(0, 0);
    transition-duration: 200ms;
    transition-property: transform;
    transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
    width: var(--space-one-point-five);

    &.active {
      transform: translate(var(--space-one-point-five), var(--space-zero));
    }
  }
}
</style>
