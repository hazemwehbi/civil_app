<template>
  <v-btn
    :loading="loading"
    :disabled="loading"
    class="cp-bases-button"
    v-bind="{...$attrs,...$props}"
    :width="width"
    :height="height"
    :style="btnStyle"
    @click="$emit('click', $event)"
  >
    <slot name="icon" />
    <span :style="labelClass">
      {{ label }}
    </span>
    <slot name="icon-left" />
  </v-btn>
</template>

<script>
export default {
  props: {
    loading: {
      type: Boolean,
      default: false,
    },
    backgroundColor: {
      type: String,
      default: "",
    },
    color: {
      type: String,
      default: "",
    },
    label: {
      type: String,
      default: null,
    },
    labelClass: {
      type: Object,
      default: () => {},
    },
    width: {
      type: [String, Number],
      default: '260px',
    },
    height: {
      type: [String, Number],
      default: '56px',
    },
    borderRadius: {
      type: [String, Number],
      default: '20px',
    },
    boxShadow: {
      type: [String, Number],
      default: '2px 5px 10px 0px hsl(219deg 77% 35% / 10%)',
    },
  },
  computed: {
    btnStyle () {
      const result = {
        'border-radius': this.borderRadius,
        color: this.color || '#fff',
        background: this.backgroundColor || `linear-gradient(135deg, ${this.$vuetify.theme.currentTheme.cpPrimary}, ${this.$vuetify.theme.currentTheme.cpPrimaryDark})`,
        'box-shadow': this.boxShadow,
      }
      return result;
    },
  },
}
</script>

<style lang="scss">
.cp-bases-button{
  &:hover{
    box-shadow: 0px 10px 20px 0 rgb(21 70 160 / 50%)
  }
}
</style>
