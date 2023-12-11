<template>
    <v-card>
        <v-layout>
            <div @mouseenter="showReports = true" @mouseleave="hideDropdowns" class="sidebar">
                <v-navigation-drawer expand-on-hover rail>

                    <v-list nav>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon color="white" class="purple-background" :class="{'border' : !showReports, 'border-home' : showReports}">mdi-home</v-icon>
                            <v-list-item-title class="home border-home2">Dashboard</v-list-item-title>
                        </v-list-item>
                        <v-list-item v-show="showReports">
                            <v-list-item-title class="reports">REPORTS</v-list-item-title>
                        </v-list-item>
                        <v-list-item v-show="!showReports">
                            <v-icon>mdi-dots-horizontal</v-icon>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon>mdi mdi-plus-box</v-icon>
                            <v-list-item-title class="smart-enroller">Smart Enroller</v-list-item-title>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon style="transform: rotate(130deg) scaleX(-1);">mdi mdi-arrow-right-circle</v-icon>
                            <v-list-item-title class="smart-enroller">Dropout Shield</v-list-item-title>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon style="transform: rotate(10deg) scaleX(-1);">mdi-autorenew</v-icon>
                            <v-list-item-title class="retention-partner">Retention Partner</v-list-item-title>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown('RiskDetector')">
                            <v-icon :class="{ 'risk-detector': isOpen('RiskDetector'), 'home': isOpen('RiskDetector'), 'border' : !showReports, 'border-home' : showReports }"
                                :color="isOpen('RiskDetector') ? 'white' : ''">mdi-google-analytics</v-icon>
                            <v-list-item-title
                                :class="{ 'risk-detector': isOpen('RiskDetector'), 'home': isOpen('RiskDetector'), 'white-text': isOpen('RiskDetector') }"
                                class="detector risk-detector border-home2">
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
                        <v-list-item @click="toggleDropdown('AcademicOffer')">
                            <v-icon :class="{ 'risk-detector': isOpen('AcademicOffer'), 'home': isOpen('AcademicOffer'), 'border' : !showReports, 'border-home' : showReports }"
                                :color="isOpen('AcademicOffer') ? 'white' : ''">mdi-school</v-icon>
                            <v-list-item-title
                                :class="{ 'risk-detector': isOpen('AcademicOffer'), 'home': isOpen('AcademicOffer'), 'white-text': isOpen('AcademicOffer') }"
                                class="detector risk-detector border-home2">
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
                        <v-list-item @click="toggleDropdown()">
                            <v-icon>mdi-poll</v-icon>
                            <v-list-item-title class="my-reports">My reports</v-list-item-title>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon>mdi-chart-box-plus-outline</v-icon>
                            <v-list-item-title class="retention-partner">Custom Reports</v-list-item-title>
                        </v-list-item>
                        <v-list-item @click="toggleDropdown()">
                            <v-icon>mdi-sitemap</v-icon>
                            <v-list-item-title class="retention-partner">Workflows</v-list-item-title>
                        </v-list-item>
                    </v-list>
                </v-navigation-drawer>
            </div>
            <v-main style="height: 250px"></v-main>
        </v-layout>
    </v-card>
</template>
<script>
export default {
    data() {
        return {
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
    methods: {
        toggleDropdown(section) {
            this.$set(this.dropdownOpen, section, !this.dropdownOpen[section]);
        },
        isOpen(section) {
            return this.dropdownOpen[section];
        },
        hideDropdowns() {
            this.showReports = false; // Cierra la sección REPORTS
            this.dropdownOpen = {}; // Cierra otras secciones si están abiertas
        }
    },
};
</script>

<style>
@import '../assets/Style/sidebar.css';
</style>
  