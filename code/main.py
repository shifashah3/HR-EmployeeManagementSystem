from PyQt6 import QtWidgets, uic
from PyQt6.QtCore import QDate
from PyQt6.QtWidgets import QApplication, QMessageBox, QMainWindow, QTableWidget, QTableWidgetItem, QVBoxLayout, QWidget, QHeaderView, QPushButton
import sys
import pyodbc
from PyQt6.QtCore import Qt

server = 'DESKTOP-IG053LF\SPARTA'
database = 'HRDB'  # Name of your database
use_windows_authentication =False  # Set to True to use Windows Authentication
username = 'sa'  # Specify a username if not using Windows Authentication
password = '12345'  # Specify a password if not using Windows Authentication

connection_string = f'DRIVER={{ODBC Driver 17 for SQL Server}};SERVER={server};DATABASE={database};UID={username};PWD={password}'
connection = pyodbc.connect(connection_string)

class UI(QtWidgets.QMainWindow):
    def __init__(self):
        super(UI, self).__init__()
        # Load the .ui file
        uic.loadUi('login.ui', self)
        self.show()
        
        self.sign_in = self.findChild(QtWidgets.QPushButton, 'sign_in')
        # print("sign in button clicked")
        self.sign_in.clicked.connect(self.handle_signin)

        self.careers_page = self.findChild(QtWidgets.QPushButton, 'careers_page')
        # print("careers page button pushed")
        self.careers_page.clicked.connect(self.handle_careerspage)
 
    def handle_signin(self):
        password = self.password.text()
        global employee_id
        employee_id=self.ID.text()
        # # print(ID, "ID ")
        # print(password, "password")
    
        cursor = connection.cursor()
        query = "SELECT EmployeeID FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()

        if not result:
            message_box = QMessageBox(self)
            message_box.setWindowTitle("Error")
            message_box.setText("Please enter a valid ID")
            message_box.setIcon(QMessageBox.Icon.Warning)
            message_box.exec()


        elif password=='':
            message_box = QMessageBox(self)
            message_box.setWindowTitle("Error")
            message_box.setText("Please enter a password")
            message_box.setIcon(QMessageBox.Icon.Warning)
            message_box.exec()

        elif password.startswith('emp'):
            cursor = connection.cursor()
            query = "SELECT Password FROM EmployeeLogin WHERE EmployeeID = ?"
            cursor.execute(query, (employee_id,))
            result = cursor.fetchone()
            # print(result[0])
            if result[0]!=password:
                message_box = QMessageBox(self)
                message_box.setWindowTitle("Error")
                message_box.setText("Wrong Password")
                message_box.setIcon(QMessageBox.Icon.Warning)
                message_box.exec()
            else:
                self.employee_screen = EmployeeScreen()
                self.employee_screen.show()

        
        elif password.startswith('hr'):
            cursor = connection.cursor()
            query = "SELECT Password FROM EmployeeLogin WHERE EmployeeID = ?"
            cursor.execute(query, (employee_id,))
            result = cursor.fetchone()
            if result[0]!=password:
                message_box = QMessageBox(self)
                message_box.setWindowTitle("Error")
                message_box.setText("Incorrect Password")
                message_box.setIcon(QMessageBox.Icon.Warning)
                message_box.exec()
            else:
                self.hr_screen = HRdashboard()
                self.hr_screen.show()
        else:
            message_box = QMessageBox(self)
            message_box.setWindowTitle("Error")
            message_box.setText("Incorrect Password")
            message_box.setIcon(QMessageBox.Icon.Warning)
            message_box.exec()
    
 
    def handle_careerspage(self):
        self.careers_page = CareersPage()
        self.careers_page.show()


class EmployeeScreen(QtWidgets.QMainWindow):
    def __init__(self):
        super(EmployeeScreen, self).__init__()

        # Load the .ui file
        uic.loadUi('EmployeeDashboard.ui', self)

        self.edit_profile = self.findChild(QtWidgets.QPushButton, 'edit_profile')
        self.edit_profile.clicked.connect(self.handle_edit_profile)
        
        self.salary_info = self.findChild(QtWidgets.QPushButton, 'salary_info')
        self.salary_info.clicked.connect(self.handle_salary_info)

        self.employee_contract = self.findChild(QtWidgets.QPushButton, 'employee_contract')
        self.employee_contract.clicked.connect(self.handle_employee_contract)

        self.attendance = self.findChild(QtWidgets.QPushButton, 'attendance')
        self.attendance.clicked.connect(self.handle_view_attendance)

        self.populate_announcments()
        
    def populate_announcments(self):
        cursor = connection.cursor()
        cursor.execute("select * from Announcement where ToUser=?", employee_id)

        # Fetch all rows and populate the table
        for row_index, row_data in enumerate(cursor.fetchall()):
            self.announcement.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.announcement.setItem(row_index, col_index, item)

        # Close the database connection
        # connection.close()
        # Adjust content display
        header = self.announcement.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.ResizeToContents)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.ResizeToContents)   

    def handle_edit_profile(self):
        print("handle emp info called")
        self.emp_info = EmployeeInformation()

        self.emp_info.show()
        

    def handle_salary_info(self):
        print("handle salary info called")
        self.salary = SalaryInfo()
        self.salary.show()
        print("Salary info")

    def handle_employee_contract(self):
        self.contract = EmployeeContract()
        self.contract.show()
        print("employee contract")

    def handle_view_attendance(self):
        self.attendance = EmployeeAttendance()
        self.attendance.show()

        
class EmployeeInformation(QtWidgets.QMainWindow):
    def __init__(self):
        super(EmployeeInformation, self).__init__()

        # Load the .ui file
        print("Initializing EmployeeInformation")
        uic.loadUi('EmployeeInformation.ui', self)
        # self.show()
        
        print("emp info")
        # employee_id = EmployeeScreen.handle_edit_profile.employeeID()
        # employee_id = self.ID.text()
        print(employee_id, " id blah")

        self.back = self.findChild(QtWidgets.QPushButton, 'back')
        self.back.clicked.connect(self.handle_back)

        self.upd_phone = self.findChild(QtWidgets.QPushButton, 'update_phone')
        self.upd_phone.clicked.connect(self.handle_updatephone)

        self.upd_address = self.findChild(QtWidgets.QPushButton, 'update_address')
        self.upd_address.clicked.connect(self.handle_updateaddress)
 
        self.fill_emp_data()

        

    def handle_back(self):
        self.employee_screen = EmployeeScreen()
        self.employee_screen.show()

    def handle_updatephone(self):
        new_phone = self.phone.text()
        cursor = connection.cursor()
        query = "UPDATE employees SET PhoneNumber = ? WHERE EmployeeID = ?"
        cursor.execute(query, (new_phone, employee_id))
        connection.commit()  # Don't forget to commit the changes to the database

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Phone Number updated successfully!")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()


    def handle_updateaddress(self):
        new_address = self.address.text()
        cursor = connection.cursor()
        query = "UPDATE employees SET Address = ? WHERE EmployeeID = ?"
        cursor.execute(query, (new_address, employee_id))
        connection.commit()  # Don't forget to commit the changes to the database

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Address updated successfully!")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()

    def fill_emp_data(self):
        # employee_id = self.ID.text()
        # print(employee_id, " id")

        #setting the employee id 
        self.ID.setText(employee_id)
        self.ID.setDisabled(True)

        #selecting the Employee First Name
        cursor = connection.cursor()
        query = "SELECT FirstName FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()

        # Update the QLineEdit with the fetched name
        if result:
            FirstName = result[0]
            self.FirstName.setText(FirstName)
        self.FirstName.setDisabled(True)

        #selecting the Employee Last Name
        cursor = connection.cursor()
        query = "SELECT LastName FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            LastName = result[0]
            self.LastName.setText(LastName)
        self.LastName.setDisabled(True)

        #select gender
        cursor = connection.cursor()
        query = "SELECT Gender FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            Gender = result[0]
            if Gender=='M':
                self.radioButton_2.setChecked(True)
                self.radioButton.setDisabled(True)
                self.radioButton_2.setDisabled(True)
                self.radioButton_3.setDisabled(True)
            elif Gender =='F':
                self.radioButton.setChecked(True)
                self.radioButton.setDisabled(True)
                self.radioButton_2.setDisabled(True)
                self.radioButton_3.setDisabled(True)
            else:
                self.radioButton_3.setChecked(True)
                self.radioButton.setDisabled(True)
                self.radioButton_2.setDisabled(True)
                self.radioButton_3.setDisabled(True)

        #selecting the Employee SSN
        cursor = connection.cursor()
        query = "SELECT SSN FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            SSN = result[0]
            self.SSN.setText(SSN)
        self.SSN.setDisabled(True)

        #selecting the Employee JobID
        cursor = connection.cursor()
        query = "SELECT JobID FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            JobID = result[0]
            self.JobID.setText(str(JobID))
        self.JobID.setDisabled(True)

        #selecting the Employee Department
        cursor = connection.cursor()
        query = "SELECT Department FROM jobs WHERE JobID = (select JobID from employees where EmployeeID=?)"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            dept = result[0]
            self.dept.setText(dept)
        self.dept.setDisabled(True)

        #selecting the Employee Salary
        cursor = connection.cursor()
        query = "SELECT Salary FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            salary = result[0]
            self.salary.setText(str(salary))
        self.salary.setDisabled(True)

        #selecting the Employee Phone number
        cursor = connection.cursor()
        query = "SELECT PhoneNumber FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            phone = result[0]
            self.phone.setText(phone)
        self.phone.setDisabled(False) #can be edited


        #selecting the Employee Residential Address
        cursor = connection.cursor()
        query = "SELECT Address FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            Address = result[0]
            self.address.setText(Address)
        self.address.setDisabled(False) #can be edited

        #selecting the Employee Onboarding Date
        cursor = connection.cursor()
        query = "SELECT OnboardingDate FROM employees WHERE EmployeeID = ?"
        cursor.execute(query, (employee_id,))
        result = cursor.fetchone()
        if result:
            date = result[0]
            self.Date.setDate(date)
        self.Date.setDisabled(True) 


class EmployeeContract(QtWidgets.QMainWindow):
    def __init__(self):
        super(EmployeeContract, self).__init__()

        # Load the .ui file
        print("Initialzing Employee Contract")
        uic.loadUi('EmployeeContract.ui', self)
        print("after initialization")

        self.back = self.findChild(QtWidgets.QPushButton, 'back')
        self.back.clicked.connect(self.handle_back)

        self.populate_table()


    def handle_back(self):
        self.employee_screen = EmployeeScreen()
        self.employee_screen.show()
        
    def populate_table(self):
        cursor = connection.cursor()

        #SQL query to fetch employee contract info
        # print(employee_id)
        cursor.execute("select * from EmployeeContract where EmployeeID=?", employee_id)

        # Fetch all rows and populate the table
        for row_index, row_data in enumerate(cursor.fetchall()):
            self.contractTable.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.contractTable.setItem(row_index, col_index, item)

        # Close the database connection
        # connection.close()
        # Adjust content display
        header = self.contractTable.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.ResizeToContents)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.ResizeToContents)   

class SalaryInfo(QtWidgets.QMainWindow):
    def __init__(self):
        super(SalaryInfo, self).__init__()

        # Load the .ui file
        print("initializing salary info")
        uic.loadUi('SalaryInfo.ui', self)
        print("after initialzation")

        self.back = self.findChild(QtWidgets.QPushButton, 'back')
        self.back.clicked.connect(self.handle_back)

        self.populate_table()


    def handle_back(self):
        self.employee_screen = EmployeeScreen()
        self.employee_screen.show()
    
    def populate_table(self):
        #SQL query to fetch employee salary info
        cursor = connection.cursor()
        cursor.execute("select * from SalaryInfo where EmployeeID=?", employee_id)

        # Fetch all rows and populate the table
        for row_index, row_data in enumerate(cursor.fetchall()):
            self.salarytable.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.salarytable.setItem(row_index, col_index, item)

        # Close the database connection
        # connection.close()
        # Adjust content display
        header = self.salarytable.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.ResizeToContents)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.ResizeToContents)   

class EmployeeAttendance(QtWidgets.QMainWindow):
    def __init__(self):
        super(EmployeeAttendance, self).__init__()

        # Load the .ui file
        print("Initialzing Employee Attendance")
        uic.loadUi('attendance.ui', self)
        print("after initialization")

        self.back = self.findChild(QtWidgets.QPushButton, 'back')
        self.back.clicked.connect(self.handle_back)

        self.populate_table()


    def handle_back(self):
        self.employee_screen = EmployeeScreen()
        self.employee_screen.show()
        
    def populate_table(self):
        cursor = connection.cursor()

        #SQL query to fetch employee contract info
        # print(employee_id)
        cursor.execute("select * from Attendance where EmployeeID=?", employee_id)

        # Fetch all rows and populate the table
        for row_index, row_data in enumerate(cursor.fetchall()):
            self.attendance.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.attendance.setItem(row_index, col_index, item)

        # Close the database connection
        # connection.close()
        # Adjust content display
        header = self.attendance.horizontalHeader()
        header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
        header.setSectionResizeMode(1, QHeaderView.ResizeMode.ResizeToContents)
        header.setSectionResizeMode(2, QHeaderView.ResizeMode.ResizeToContents)  

class CareersPage(QtWidgets.QMainWindow):
    def __init__(self):
        super(CareersPage, self).__init__()

        # Load the Careers Page UI file
        uic.loadUi('careersPage.ui', self)

        # Connect the UI elements
        self.selectPushButton = self.findChild(QPushButton, 'selectPushButton')
        self.tableWidget = self.findChild(QTableWidget, 'tableWidget')

        # Connect the button click event to the method
        self.selectPushButton.clicked.connect(self.open_job_application)

        # Connect the itemSelectionChanged signal to the slot
        self.tableWidget.itemSelectionChanged.connect(self.handle_selection_change)

        # Populate the table with data from the database
        self.populate_table_data()

    def populate_table_data(self):
        try:
            # Establish a connection to the database
            connection = pyodbc.connect(connection_string)

            # Execute a query to fetch job data
            query = 'SELECT * FROM jobs'
            cursor = connection.cursor()
            cursor.execute(query)

            # Fetch all rows and populate the table
            rows = cursor.fetchall()
            self.tableWidget.setRowCount(len(rows))
            for row_num, row_data in enumerate(rows):
                for col_num, value in enumerate(row_data):
                    item = QTableWidgetItem(str(value))
                    self.tableWidget.setItem(row_num, col_num, item)

        except pyodbc.Error as e:
            print(f'Error connecting to the database: {e}')

        finally:
            # Close the database connection
            if 'connection' in locals():
                connection.close()

    def handle_selection_change(self):
        selected_items = self.tableWidget.selectedItems()

        # Enable the search button only when a full row is selected
        self.selectPushButton.setEnabled(len(selected_items) == self.tableWidget.columnCount())

    def open_job_application(self):
        selected_row = self.tableWidget.currentRow()

        if selected_row >= 0:

            uic.loadUi('JobApplication.ui', self)
            self.show()
        

class JobApplicationUI(QtWidgets.QMainWindow):
    def __init__(self):
        super(JobApplicationUI, self).__init__()
        # Load the UI file
        uic.loadUi('JobApplication.ui', self)

        self.ui = uic.loadUi('JobApplication.ui', self)  # Load the UI file
        #self.ui.Apply.clicked.connect(self.check_fields_and_apply)

        # Show the loaded UI
        self.ui.show()

    def check_fields_and_apply(self):
    # Assuming lineEdit1, lineEdit2, ..., lineEdit6, and comboBox1 are the names of your widgets
        line_edits = [self.ui.FirstName, self.ui.LastName, self.ui.PhoneNumber, self.ui.EmailAddress, self.ui.DOB, self.ui.DateApplied]
        combo_box = self.ui.Qualifications

        if all(widget.text() for widget in line_edits) != "" and combo_box.currentText() == " ":
            QMessageBox.information(self, 'Applied!', 'All fields filled. Applied!')
            self.close()
        else:
            QMessageBox.warning(self, 'Error', 'Not all fields filled.')

        
    def check_all_boxes_filled(self):
        self.Apply.setEnabled(True)

    # def on_button_clicked(self):
    #     # Function to be executed when the button is clicked
    #     if any([
    #         # not self.ApplicantID.text(),
    #         # not self.PositionAppliedFor.text(),
    #         not self.FirstName.text(),
    #         not self.LastName.text(),
    #         not self.PhoneNumber.text(),
    #         not self.EmailAddress.text(),
    #         not self.DOB.text(),
    #         not self.DateApplied.text(),
    #         self.Qualifications.currentText() == ' ',
    #     ]):
    #         QtWidgets.QMessageBox.warning(self, "Error", "Not all fields were filled.")
    #     else:
    #         QtWidgets.QMessageBox.information(self, "Success", "Applied!")

class HRdashboard(QtWidgets.QMainWindow): #HR dashboard
    def __init__(self):
        super(HRdashboard, self).__init__()

        uic.loadUi('HRRecords.ui', self) #Load .ui file
        self.show()

        self.empAttendance = self.findChild(QtWidgets.QPushButton, 'viewEmployeeAttendance')
        self.empAttendance.clicked.connect(self.handle_empAttendance)

        self.jobApplications = self.findChild(QtWidgets.QPushButton, 'viewJobApplications')
        self.jobApplications.clicked.connect(self.handle_Applications)

        self.sendAnnouncement = self.findChild(QtWidgets.QPushButton, 'sendAnnouncement')
        self.sendAnnouncement.clicked.connect(self.handle_Announcement)

    def handle_empAttendance(self):
        print("handle_empAttendance info called")
    
        self.emp_attendance = viewEmployeeAttendance()
        self.emp_attendance.show()

    def handle_searchEmployee(self):
        print("handle_searchEmployee called")

        self.searchEmp = seachForEmployee()
        self.searchEmp.show()


    def handle_Applications(self):
        print("handle_Applications called")

        self.viewJobApplications = viewJobApplications()
        self.viewJobApplications.show()


    def handle_Announcement(self):
        print("handle_Announcement called")

        self.sendAnnouncement = sendAnnouncement()
        self.sendAnnouncement.show()

class viewEmployeeAttendance(QtWidgets.QMainWindow): #Employee attendance screen
    def __init__(self):
        super(viewEmployeeAttendance, self).__init__()

        uic.loadUi("ViewAttendance.ui", self) #Load .ui file

        self.empID = self.findChild(QtWidgets.QLineEdit, 'employee_id')
        self.date_input = self.findChild(QtWidgets.QDateEdit, 'attendance_date')

        self.searchAttendance = self.findChild(QtWidgets.QPushButton, 'attendanceSearchButton')
        self.searchAttendance.clicked.connect(self.populateAttendance)
        
        global employee_id
        global selected_date
        employee_id = self.empID.text()
        selected_date = str(self.date_input.date())

    def populateAttendance(self): #Populate the table
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM Attendance")

        # Fetch all records
        #attendance_records = cursor.fetchall()

        # Clear existing table contents
        self.table_widget.clearContents()
        self.table_widget.setRowCount(0)

        for row_index, row_data in enumerate(cursor.fetchall()):
            self.empAttendance.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.empAttendance.setItem(row_index, col_index, item)

#         # header = self.attendance.horizontalHeader()
#         # header.setSectionResizeMode(0, QHeaderView.ResizeMode.Stretch)
#         # header.setSectionResizeMode(1, QHeaderView.ResizeMode.ResizeToContents)
#         # header.setSectionResizeMode(2, QHeaderView.ResizeMode.ResizeToContents)  

        def handle_back(self):
            self.HR_records_screen = HRdashboard()
            self.HR_records_screen.show()

class seachForEmployee(QtWidgets.QMainWindow): #Search for employee screen
    def __init__(self):
        super(seachForEmployee, self).__init__()

        uic.loadUi("Search for Employee.ui", self) #Load .ui file

        self.empID = self.findChild(QtWidgets.QLineEdit, 'employeeID')
        self.fName = self.findChild(QtWidgets.QDateEdit, 'firstName')
        self.lName = self.findChild(QtWidgets.QDateEdit, 'lastName')
        self.dept = self.findChild(QtWidgets.QComboBox, 'department')

        self.back = self.findChild(QtWidgets.QPushButton, 'backButton')
        self.back.clicked.connect(self.handle_back)

        self.searchEmployee = self.findChild(QtWidgets.QPushButton, 'search')
        self.searchEmployee.clicked.connect(self.populateEmployees)

        self.addEmployee = self.findChild(QtWidgets.QPushButton, 'addEmployee')
        self.addEmployee.clicked.connect(self.addNewEmployee)

    def populateEmployees(self):
        employeeID = self.employeeID.text()
        firstName = self.firstName.text()
        lastName = self.lastName.text()
        department = self.department.currentText()

        cursor = connection.cursor()
        # query = "SELECT e.employeeID, e.firstName, e.lastName, e.gender, e.DOB, j.position, j.department, j.location FROM employee e INNER JOIN job j ON e.jobID = j.jobID WHERE employeeID = ? OR FirstName = ? OR LastName = ? OR Department = ? "
        # cursor.execute(query, (employeeID, firstName, lastName, department))
        cursor.execute("SELECT * FROM employees")

        # Fetch all records
        #employeeRecords = cursor.fetchall()

        # Clear existing table contents
        self.tableWidget.clearContents()
        self.tableWidget.setRowCount(0)

        for row_index, row_data in enumerate(cursor.fetchall()):
            self.tableWidget.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.tableWidget.setItem(row_index, col_index, item)

    def handle_back(self):
        self.HR_records_screen = HRdashboard()
        self.HR_records_screen.show()


    def addNewEmployee(self):
            
        uic.loadUi("Employee Information.ui", self) #Load .ui file

        self.empID = self.findChild(QtWidgets.QLineEdit, 'employeeID')
        self.fName = self.findChild(QtWidgets.QDateEdit, 'firstName')
        self.lName = self.findChild(QtWidgets.QDateEdit, 'lastName')
        self.femaleButton = self.findChild(QtWidgets.QRadioButton, 'fRadio')
        self.maleButton = self.findChild(QtWidgets.QRadioButton, 'mRadio')
        self.xButton = self.findChild(QtWidgets.QRadioButton, 'xRadio')
        self.SSN = self.findChild(QtWidgets.QLineEdit, 'SSNLine')
        self.jobID = self.findChild(QtWidgets.QLineEdit, 'JobIDLine')
        self.dept = self.findChild(QtWidgets.QComboBox, 'department')
        self.salary = self.findChild(QtWidgets.QLineEdit, 'SalaryLine')
        self.phoneNum = self.findChild(QtWidgets.QLineEdit, 'PhoneLine')
        self.address = self.findChild(QtWidgets.QLineEdit, 'AddressLine')
        self.onboarding = self.findChild(QtWidgets.QDateEdit, 'dateEdit')

        self.addEmp = self.findChild(QtWidgets.QPushButton, 'AddEmployeeButton')
        self.addEmp.clicked.connect(self.handle_addEmployee)

        self.back = self.findChild(QtWidgets.QPushButton, 'backButton')
        self.back.clicked.connect(self.handle_back)

    def handle_addEmployee(self):
        newEmp_fName = self.fName.text()
        newEmp_lName = self.lName.text()
        if self.mRadio.isChecked():
            newEmp_gender = "M"
        elif self.fRadio.isChecked():
            newEmp_gender = "F"
        elif self.xRadio.isChecked():
            newEmp_gender = "X"
        newEmp_SSN = self.SSNLine.text()
        newEmp_jobID = self.JobIDLine.text()
        newEmp_dept = self.department.currentText()
        newEmp_salary = self.SalaryLine.text()
        newEmp_phone = self.PhoneLine.text()
        newEmp_address = self.AddressLine.text()

        cursor = connection.cursor()
        query = "INSERT INTO employees (FirstName, LastName, Position, JobID, Gender, SSN, DOB, Salary, PhoneNumber, Address, OnboardingDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
        cursor.execute(query, (newEmp_fName, newEmp_lName, newEmp_gender, newEmp_SSN, newEmp_jobID, newEmp_dept, newEmp_salary, newEmp_phone, newEmp_address))
        connection.commit()  # Don't forget to commit the changes to the database

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Employee added successfully!")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()

    def handle_back(self):
        self.seachForEmployee_screen = seachForEmployee()
        self.seachForEmployee_screen.show()

class viewJobApplications(QtWidgets.QMainWindow):
    def __init__(self):
        super(viewJobApplications, self).__init__()

        uic.loadUi("ViewApplications.ui", self) #Load .ui file

        # self.accept = self.findChild(QtWidgets.QDateEdit, 'acceptButton')
        self.acceptButton.clicked.connect(self.accept_application)

        # self.reject = self.findChild(QtWidgets.QDateEdit, 'rejectButton')
        self.rejectButton.clicked.connect(self.reject_application)

        self.back = self.findChild(QtWidgets.QPushButton, 'backButton')
        self.back.clicked.connect(self.handle_back)

        # self.acceptButton.setEnabled(False)
        # self.rejectButton.setEnabled(False)

        self.populateApplications()

    def populateApplications(self):
        cursor = connection.cursor()

        cursor.execute("select * from Applicants")

        for row_index, row_data in enumerate(cursor.fetchall()):
            self.tableWidget.insertRow(row_index)
            for col_index, cell_data in enumerate(row_data):
                item = QTableWidgetItem(str(cell_data))
                self.tableWidget.setItem(row_index, col_index, item)

    def handle_selection_change(self):
        selected_rows = self.tableWidget.selectionModel().selectedRows()

        # # Enable/disable buttons based on the number of selected rows
        # self.acceptButton.setEnabled(len(selected_rows) >= 1)
        # self.rejectButton.setEnabled(len(selected_rows) >= 1)

    def accept_application(self):
        selected_row = self.tableWidget.currentRow()
        applicant_id = int(self.tableWidget.item(selected_row, 0).text())

        connection = pyodbc.connect(connection_string) 
        cursor = connection.cursor()
        cursor.execute("DELETE FROM Applicants WHERE ApplicantID = ?", applicant_id)
        connection.commit()

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Applicant accepted! Interview email sent")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()

        connection.close()

    def reject_application(self):
        selected_row = self.tableWidget.currentRow()
        applicant_id = int(self.tableWidget.item(selected_row, 0).text())

        connection = pyodbc.connect(connection_string) 
        cursor = connection.cursor()
        cursor.execute("DELETE FROM Applicants WHERE ApplicantID = ?", applicant_id)
        connection.commit()

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Applicant rejected. Rejection email sent")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()

        connection.close()

    def handle_back(self):
        self.HR_records_screen = HRdashboard()
        self.HR_records_screen.show()

class sendAnnouncement(QtWidgets.QMainWindow):
    def __init__(self):
        super(sendAnnouncement, self).__init__()

        uic.loadUi("Announcements.ui", self) #Load .ui file

        self.empID = self.findChild(QtWidgets.QLineEdit, 'employeeID')
        self.description = self.findChild(QtWidgets.QTextEdit, 'description')

        self.send = self.findChild(QtWidgets.QPushButton, 'sendButton')
        self.send.clicked.connect(self.handle_send)

        self.back = self.findChild(QtWidgets.QPushButton, 'backButton')
        self.back.clicked.connect(self.handle_back)

    def handle_send(self):

        announcement_to = self.employeeID.text()
        announcement_desc = self.description.toPlainText()

        connection = pyodbc.connect(connection_string) 
        cursor = connection.cursor()
        cursor.execute("INSERT INTO Announcement WHERE ToUser = ?, Description = ?", announcement_to, announcement_desc)
        connection.commit()

        message_box = QMessageBox(self)
        message_box.setWindowTitle("Success")
        message_box.setText("Announcement sent")
        message_box.setIcon(QMessageBox.Icon.Information)
        message_box.exec()

        connection.close()

    def handle_back(self):
        self.HR_records_screen = HRdashboard()
        self.HR_records_screen.show()




def main():
    app = QApplication(sys.argv)
    window = UI()
    window.show()
    sys.exit(app.exec())


if __name__ == "__main__":
    main()