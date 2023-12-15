<template>
    <nav height="63" class="nav">
        <div class="mobile-menu">
            <v-menu offset-y>
                <template v-slot:activator="{ on }">
                    <v-btn icon v-on="on">
                        <v-icon color="white">mdi-menu</v-icon>
                    </v-btn>
                </template>

                <v-list nav>
                    <v-list-item>
                        <v-icon color="white" class="purple-background">mdi-home</v-icon>
                        <v-list-item-title class="home border-home2">Dashboard</v-list-item-title>
                    </v-list-item>
                    <v-list-item>
                        <v-list-item-title class="reports">REPORTS</v-list-item-title>
                    </v-list-item>
                    <v-list-item>
                        <v-icon>mdi mdi-plus-box</v-icon>
                        <v-list-item-title class="smart-enroller">Smart Enroller</v-list-item-title>
                    </v-list-item>
                    <v-list-item>
                        <v-icon style="transform: rotate(130deg) scaleX(-1);">mdi mdi-arrow-right-circle</v-icon>
                        <v-list-item-title class="smart-enroller">Dropout Shield</v-list-item-title>
                    </v-list-item>
                    <v-list-item >
                        <v-icon style="transform: rotate(10deg) scaleX(-1);">mdi-autorenew</v-icon>
                        <v-list-item-title class="retention-partner">Retention Partner</v-list-item-title>
                    </v-list-item>
                    <v-list-item @click="toggleDropdown('RiskDetector')" @click.stop="doNotCloseMenu">
                        <v-icon
                            :class="{ 'risk-detector': isOpen('RiskDetector'), 'home': isOpen('RiskDetector') }"
                            :color="isOpen('RiskDetector') ? 'white' : ''">mdi-google-analytics</v-icon>
                        <v-list-item-title
                            :class="{ 'risk-detector': isOpen('RiskDetector'), 'home': isOpen('RiskDetector'), 'white-text': isOpen('RiskDetector') }"
                            class="detector risk-detector">
                            Risk Detector
                            <v-icon v-if="!isOpen('RiskDetector')"
                                :color="isOpen('RiskDetector') ? 'white' : ''">mdi-chevron-down</v-icon>
                            <v-icon v-else :color="isOpen('RiskDetector') ? 'white' : ''">mdi-chevron-up</v-icon>
                        </v-list-item-title>
                    </v-list-item>

                    <v-list v-show="isOpen('RiskDetector')">
                        <v-list-item v-for="report in reports" :key="report.id">
                            <ul>
                                <li>{{ report.title }}</li>
                            </ul>
                        </v-list-item>
                    </v-list>
                    <v-list-item @click="toggleDropdown('AcademicOffer')" @click.stop="doNotCloseMenu">
                        <v-icon
                            :class="{ 'risk-detector': isOpen('AcademicOffer'), 'home': isOpen('AcademicOffer') }"
                            :color="isOpen('AcademicOffer') ? 'white' : ''">mdi-school</v-icon>
                        <v-list-item-title
                            :class="{ 'risk-detector': isOpen('AcademicOffer'), 'home': isOpen('AcademicOffer'), 'white-text': isOpen('AcademicOffer') }"
                            class="detector risk-detector">
                            Academic Offer
                            <v-icon v-if="!isOpen('AcademicOffer')"
                                :color="isOpen('AcademicOffer') ? 'white' : ''">mdi-chevron-down</v-icon>
                            <v-icon v-else :color="isOpen('AcademicOffer') ? 'white' : ''">mdi-chevron-up</v-icon>
                        </v-list-item-title>
                    </v-list-item>
                    <v-list v-show="isOpen('AcademicOffer')">
                        <v-list-item v-for="academicOffer in academicOffers" :key="academicOffer.id">
                            <ul>
                                <li>{{ academicOffer.title }}</li>
                            </ul>
                        </v-list-item>
                    </v-list>
                    <v-list-item>
                        <v-icon>mdi-poll</v-icon>
                        <v-list-item-title class="my-reports">My reports</v-list-item-title>
                    </v-list-item>
                    <v-list-item>
                        <v-icon>mdi-chart-box-plus-outline</v-icon>
                        <v-list-item-title class="retention-partner">Custom Reports</v-list-item-title>
                    </v-list-item>
                    <v-list-item>
                        <v-icon>mdi-sitemap</v-icon>
                        <v-list-item-title class="retention-partner">Workflows</v-list-item-title>
                    </v-list-item>
                </v-list>
            </v-menu>
        </div>

        <div>
            <img src="../assets/Images/logo.png" alt="EdMachina" class="logo">
        </div>
        <div class="content">
            <button><v-icon color="white">mdi-web</v-icon></button>
            <button><v-icon style="transform: rotate(-30deg)" color="white">mdi-moon-waning-crescent</v-icon></button>
            <v-badge color="red" content="4" overlap>
                <button> <v-icon color="white">mdi-bell</v-icon></button>
            </v-badge>

            <v-list-item>
                <div class="admin">
                    <h4 class="person">{{jsonData.name}} {{ jsonData.lastName }}</h4>
                    <p class="admin2">{{jsonData.role}}</p>
                </div>
                <v-list-item-avatar class="avatar" size="45">
                    <v-img :src="jsonData.picture"></v-img>
                </v-list-item-avatar>
                <span class="indicator"></span>
            </v-list-item>
        </div>
    </nav>
</template>
<script>
import  jsonData  from '../json/data.json';

export default {
    data() {
        return {
            jsonData: null,
            menuItems: ['Opción 1', 'Opción 2', 'Opción 3'],
            showReports: false,
            dropdownOpen: {},
            drawer: false,
            reports: [
                { id: 1, title: 'My Reports' },
                { id: 2, title: 'My Reports' },
                { id: 3, title: 'My Reports' },
            ],
            academicOffers: [
                { id: 1, title: 'Academic Offer' },
                { id: 2, title: 'Academic Offer' },
                { id: 3, title: 'Academic Offer' }
            ]
        };
    },
    mounted(){
        this.jsonData = jsonData.admins[0]
        console.log(this.jsonData);

    },
    methods: {
        toggleDropdown(section) {
            this.$set(this.dropdownOpen, section, !this.dropdownOpen[section]);
        },
        isOpen(section) {
            return this.dropdownOpen[section];
        },
        doNotCloseMenu() {}
    },
}

</script>


<style>
@import '../assets/Style/nav.css';
</style>
  