<template>
    <div class="menu scrollable-container">
        <v-card class="card">
            <div class="carta name">
                <v-list-item-avatar class="avatarMenu" size="65">
                    <v-img v-if="jsonData" :src="jsonData.image"></v-img>
                </v-list-item-avatar>
                <p class="lastName">{{ jsonData.firstName }} {{ jsonData.lastName }}</p>
            </div>
            <div class="name paragraphs">
                <p class="id">Reg. ID: {{ jsonData.id }} <button class="copy2"><span
                            class="mdi mdi-content-copy copy"></span></button></p>
                <p class="id">Status: {{ jsonData.status }}</p>
            </div>
            <div class="icons-list">
                <button><v-icon>mdi-playlist-edit</v-icon></button>
                <button><v-icon>mdi-message-text</v-icon></button>
                <button><v-icon>mdi-calendar-today</v-icon></button>
                <button><v-icon>mdi-email</v-icon></button>
                <button><v-icon>mdi mdi-phone</v-icon></button>
                <button><v-icon>mdi-dots-horizontal</v-icon></button>
            </div>
        </v-card>
        <div class="datos2">
            <v-card>
                <v-list-item @click="toggleDropdown('Student')">
                    <v-list-item-title class="about">
                        <div class="d-flex"><v-icon>mdi mdi-drag-vertical</v-icon><b class="about">Sobre el Estudiante</b>
                        </div>
                        <v-icon>{{ isOpen('Student') ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
                    </v-list-item-title>
                </v-list-item>
                <v-list v-show="isOpen('Student')">
                    <v-list-item>
                        <div class="datos">
                            <p>Período: {{ aboutStudent.period }}</p>
                            <p>Status: {{ aboutStudent.status }}</p>
                            <p>Colegio: {{ aboutStudent.college }}</p>
                            <p>Mod. Adminisión: {{ aboutStudent.adminision }}</p>
                            <p>Segmento: {{ aboutStudent.segment }}</p>
                            <p>Segmento Detalle: {{ aboutStudent.segmentDetail }}</p><br>
                            <p class="riesgo">Detalle Riesgo de Ingreso:</p>
                            <div class="long-line"></div>
                            <div class="d-flex subjects">
                                <div class="subjects2">
                                    <p>Matemática:</p>
                                    <p>Química:</p>
                                    <p>Programación:</p>
                                    <p>Comunicación:</p>
                                </div>
                                <div class="subjects3">
                                    <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                    <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                    <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                    <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                </div>
                            </div>
                            <div class="subjects4">
                                <p>Matemática:</p>
                                <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                <p>Química:</p>
                                <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                <p>Programación:</p>
                                <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                                <p>Comunicación:</p>
                                <p>
                                        {{ riskDetail.subject.risk }} <br>
                                        Nota: ({{ riskDetail.subject.note }})
                                    </p>
                            </div>
                        </div>
                    </v-list-item>
                </v-list>
            </v-card>
            <v-card class="aboutStudent">
                <v-list-item @click="toggleDropdown('aboutStudent')">
                    <v-list-item-title class="about">
                        <div class="d-flex"><v-icon>mdi mdi-drag-vertical</v-icon><b class="about">About</b>
                        </div>
                        <v-icon>{{ isOpen('aboutStudent') ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
                    </v-list-item-title>
                </v-list-item>
                <v-list v-show="isOpen('aboutStudent')">
                    <v-list-item>
                        <div class="datos">
                            <p>First Name: <br>{{ jsonData.firstName }}</p>
                            <p>Last Name: <br>{{ jsonData.lastName }}</p>
                            <div class="email">
                                <p class="pencil2">Email:
                                    <button class="mdi mdi-pencil pencil"></button><br>
                                    {{ jsonData.email }}
                                </p>
                            </div>
                            <div class="long-line2"></div>
                            <p>Phone Number: <br> +{{ jsonData.phoneNumber }}</p>
                            <p>Country: <br>{{ jsonData.country }}</p>
                            <p>Category: <br> {{ jsonData.category }}</p>
                        </div>
                    </v-list-item>
                </v-list>
            </v-card>
            <v-card class="aboutStudent">
                <v-list-item @click="toggleDropdown('careerDetails')">
                    <v-list-item-title class="about">
                        <div class="d-flex"><v-icon>mdi mdi-drag-vertical</v-icon><b class="about">Career Details</b>
                        </div>
                        <v-icon>{{ isOpen('careerDetails') ? 'mdi-chevron-up' : 'mdi-chevron-down' }}</v-icon>
                    </v-list-item-title>
                </v-list-item>
                <v-list v-show="isOpen('careerDetails')">
                    <v-list-item>
                        <div class="datos">
                            <label for="careerName">Career Name: </label><br>
                            <div class="custom-select">
                                <select id="careerName" class="select">
                                    <option>Choose your career</option>
                                    <option class="option">{{ careerDetails.careerName }}</option>
                                </select>
                                <span class="mdi mdi-menu-down"></span>
                            </div>
                            <p>Career ID: <br>{{ careerDetails.careerId }}</p>
                            <p>Type: <br>{{ careerDetails.type }}</p>
                            <p>Modality: <br>{{ careerDetails.modality }}</p>
                            <p>Status: <br>{{ careerDetails.status }}</p>
                            <p>Student ID: <br>{{ careerDetails.studentId }}</p>
                            <p>Cohort: <br>{{ careerDetails.cohort }}</p>


                        </div>
                    </v-list-item>
                </v-list>
            </v-card>
            <v-card class="aboutStudent">
                <v-list-item @click="toggleDropdown()">
                    <div class="manage-widgets">
                        <p>Manage Widgets</p>
                    </div>
                </v-list-item>
            </v-card>

        </div>
    </div>
</template>
<script>
import  jsonData  from '../json/data.json';

export default {
    data() {
        return {
            jsonData: null,
            dropdownOpen: {},
            aboutStudent: null,
            riskDetail: null,
            careerDetails: null
        };
    },
    mounted() {
        this.jsonData = jsonData.students[0];
        this.aboutStudent = jsonData.students[0].aboutStudent;
        this.riskDetail = jsonData.students[0].aboutStudent.riskDetail;
        this.careerDetails = jsonData.students[0].careerDetails;
    },
    methods: {
        toggleDropdown(section) {
            this.$set(this.dropdownOpen, section, !this.dropdownOpen[section]);
        },
        isOpen(section) {
            return this.dropdownOpen[section];
        }
    },
};
</script>

<style>
@import '../assets/Style/menu.css';
</style>

