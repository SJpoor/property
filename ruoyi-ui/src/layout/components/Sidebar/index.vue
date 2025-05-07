<template>
    <div :class="{'has-logo':showLogo}" :style="{ backgroundColor: sideTheme === 'theme-dark' ? variables.menuBackground : sideTheme === 'theme-blue' ? variables.menuBlueLightBackground : variables.menuLightBackground }">
        <logo v-if="showLogo" :collapse="isCollapse" />
        <el-scrollbar :class="settings.sideTheme" wrap-class="scrollbar-wrapper">
            <el-menu
                :default-active="activeMenu"
                :collapse="isCollapse"
                :background-color="sideTheme === 'theme-dark' ? variables.menuBackground : sideTheme === 'theme-blue' ? variables.menuBlueLightBackground : variables.menuLightBackground"
                :text-color="sideTheme === 'theme-dark' ? variables.menuColor : sideTheme === 'theme-blue' ? variables.menuBlueLightColor : variables.menuLightColor"
                :unique-opened="true"
                :active-text-color="settings.theme"
                :collapse-transition="false"
                mode="vertical"
            >
                <sidebar-item
                    v-for="(route, index) in sidebarRouters"
                    :key="route.path  + index"
                    :item="route"
                    :base-path="route.path"
                />
            </el-menu>
        </el-scrollbar>
    </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";
import Logo from "./Logo";
import SidebarItem from "./SidebarItem";
import variables from "@/assets/styles/variables.scss";

export default {
    components: { SidebarItem, Logo },
    computed: {
        ...mapState(["settings"]),
        ...mapGetters(["sidebarRouters", "sidebar"]),
        sideTheme() {
          let roles = this.$store.getters.roles
          if(roles.includes('admin')){
            return 'theme-dark'
          }else{
            return 'theme-blue'
          }
        },
        activeMenu() {
            const route = this.$route;
            const { meta, path } = route;
            // if set path, the sidebar will highlight the path you set
            if (meta.activeMenu) {
                return meta.activeMenu;
            }
            return path;
        },
        showLogo() {
            return this.$store.state.settings.sidebarLogo;
        },
        variables() {
            return variables;
        },
        isCollapse() {
            return !this.sidebar.opened;
        }
    },
    created() {
      let roles = this.$store.getters.roles
      if(roles.includes('admin')){
        return 'theme-dark'
      }else{
        return 'theme-blue'
      }
    }
};
</script>
