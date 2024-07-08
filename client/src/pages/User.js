import { useEffect, useState } from "react";
import {
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogContentText,
  DialogTitle,
  TextField,
  MenuItem,
  Paper,
  TableContainer,
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
  TablePagination,
  Grid,
  Divider,
  Typography,
  Radio,
  CircularProgress,
  Backdrop,
  Switch,
  IconButton,
  InputAdornment,
  FormControlLabel,
  Container,
} from "@mui/material";
import useMediaQuery from "@mui/material/useMediaQuery";
import { useTheme, styled } from "@mui/material/styles";
import LoadingButton from "@mui/lab/LoadingButton";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import DeleteForeverIcon from "@mui/icons-material/DeleteForever";
import dayjs from "dayjs";

import Swal from "sweetalert2";

import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";
import PrintIcon from "@mui/icons-material/Print";
import { cleanDigitSectionValue } from "@mui/x-date-pickers/internals/hooks/useField/useField.utils";
import { YearCalendar } from "@mui/x-date-pickers";

function User() {
  const relativeTime = require("dayjs/plugin/relativeTime");
  const [open, setOpen] = useState(false);
  const [openModalUpdate, setOpenModalUpdate] = useState(false);
  const [openModalMealPlanning, setOpenModalMealPlanning] = useState(false);
  const [openModalUpdatePassword, setOpenModalUpdatePassword] = useState(false);
  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const modalWidth = useMediaQuery(theme.breakpoints.down("md"));

  const [fullname, setFullname] = useState("");
  const [username, setUsername] = useState("");
  const [height, setHeight] = useState(0);
  const [weight, setWeight] = useState(0);
  const [roles, setRoles] = useState([]);
  const [selectedRole, setSelectedRole] = useState("");
  const [birthdate, setBirthdate] = useState(null);
  const [age, setAge] = useState(0);
  const [gender, setGender] = useState("Male");
  const [contact, setContact] = useState("");
  const [address, setAddress] = useState("");
  const [medicalConditions, setMedicalConditions] = useState("");
  const [allergies, setAllergies] = useState("");
  const [currentMedication, setCurrentMedication] = useState("");
  const [familyDoctor, setFamilyDoctor] = useState("");
  const [doctorContact, setDoctorContact] = useState("");
  const [parentName, setParentName] = useState("");
  const [parentContact, setParentContact] = useState("");
  const [parentAddress, setParentAddress] = useState("");
  const [membershipType, setMembershipType] = useState("");
  const [startDate, setStartDate] = useState(null);
  const [endDate, setEndtDate] = useState(null);

  const [users, setUsers] = useState([]);

  const [isLoading, setIsLoading] = useState(true);
  const [isBtnLoading, setIsBtnLoading] = useState(false);
  const [usernameIsValid, setUsernameIsValid] = useState(false);
  const [isVisible, setIsVisible] = useState(true);
  const [updateBirthdate, setUpdateBirthdate] = useState(null);
  const [updateStartDate, setUpdateStartDate] = useState(null);
  const [updateEndDate, setUpdateEndDate] = useState(null);

  const [mealPlanUser, setMealPlanUser] = useState();
  const [hasMealPlan, setHasMealPlan] = useState(false);

  const [selectedUser, setSelectedUser] = useState("");
  const [selectedUserPassword, setSelectedUserPassword] = useState("");
  const [passwordButton, setPasswordButton] = useState(false);

  const [createButtonIsDisabled, setcreateButtonIsDisabled] = useState(true);
  const [adminRole, setAdminRole] = useState(true);

  const [membership, setMembershipData] = useState();
  const [membershipPrice, setMembershipPrice] = useState([]);
  const [price, setPrice] = useState(0);

  // MEAL DATA
  const [sundayBreakfast, setSundayBreakfast] = useState("");
  const [sundayLunch, setSundayLunch] = useState("");
  const [sundayDinner, setSundayDinner] = useState("");

  const [mondayBreakfast, setMondayBreakfast] = useState("");
  const [mondayLunch, setMondayLunch] = useState("");
  const [mondayDinner, setMondayDinner] = useState("");

  const [tuesdayBreakfast, setTuesdayBreakfast] = useState("");
  const [tuesdayLunch, setTuesdayLunch] = useState("");
  const [tuesdayDinner, setTuesdayDinner] = useState("");

  const [wednesdayBreakfast, setWednesdayBreakfast] = useState("");
  const [wednesdayLunch, setWednesdayLunch] = useState("");
  const [wednesdayDinner, setWednesdayDinner] = useState("");

  const [thursdayBreakfast, setThursdayBreakfast] = useState("");
  const [thursdayLunch, setThursdayLunch] = useState("");
  const [thursdayDinner, setThursdayDinner] = useState("");

  const [fridayBreakfast, setFridayBreakfast] = useState("");
  const [fridayLunch, setFridayLunch] = useState("");
  const [fridayDinner, setFridayDinner] = useState("");

  const [saturdayBreakfast, setSaturdayBreakfast] = useState("");
  const [saturdayLunch, setSaturdayLunch] = useState("");
  const [saturdayDinner, setSaturdayDinner] = useState("");

  //CREATE MEAL DATA

  const [bmiValue, setBmiValue] = useState("");
  const [bmiMessage, setBmiMessage] = useState("");
  const [classsificationColor, setClasssificationColor] = useState("");
  const [recommendedMeals, setRecommendedMeals] = useState([]);

  const [sundayReadyBreakfast, setSundayReadyBreakfast] = useState("");
  const [sundayReadyLunch, setSundayReadyLunch] = useState("");
  const [sundayReadyDinner, setSundayReadyDinner] = useState("");

  const [mondayReadyBreakfast, setMondayReadyBreakfast] = useState("");
  const [mondayReadyLunch, setMondayReadyLunch] = useState("");
  const [mondayReadyDinner, setMondayReadyDinner] = useState("");

  const [tuesdayReadyBreakfast, setTuesdayReadyBreakfast] = useState("");
  const [tuesdayReadyLunch, setTuesdayReadyLunch] = useState("");
  const [tuesdayReadyDinner, setTuesdayReadyDinner] = useState("");

  const [wednesdayReadyBreakfast, setWednesdayReadyBreakfast] = useState("");
  const [wednesdayReadyLunch, setWednesdayReadyLunch] = useState("");
  const [wednesdayReadyDinner, setWednesdayReadyDinner] = useState("");

  const [thursdayReadyBreakfast, setThursdayReadyBreakfast] = useState("");
  const [thursdayReadyLunch, setThursdayReadyLunch] = useState("");
  const [thursdayReadyDinner, setThursdayReadyDinner] = useState("");

  const [fridayReadyBreakfast, setFridayReadyBreakfast] = useState("");
  const [fridayReadyLunch, setFridayReadyLunch] = useState("");
  const [fridayReadyDinner, setFridayReadyDinner] = useState("");

  const [saturdayReadyBreakfast, setSaturdayReadyBreakfast] = useState("");
  const [saturdayReadyLunch, setSaturdayReadyLunch] = useState("");
  const [saturdayReadyDinner, setSaturdayReadyDinner] = useState("");

  const [startDateRange, setStartDateRange] = useState(dayjs(new Date()));
  const [endDateRange, setEndDateRange] = useState(dayjs(new Date()));

  const [tableHasNoData, setTableHasNoData] = useState(true);
  const [totalSale, setTotalSale] = useState("0");
  const dietType = [
    {
      id: "1",
      diet_type: "No data",
    },
  ];

  const [typeDiet, setTypeDiet] = useState("");
  const [totalCalories, setTotalCalories] = useState("");

  const [minAgeAlert, setMinAgeAlert] = useState(true);

  // data table
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const handleClickOpen = () => {
    setOpen(true);
    populateRoleInput();
  };

  const handleClose = () => {
    setMinAgeAlert(true);
    setOpen(false);
    setAge(0);
    setHeight(0);
    setWeight(0);
    setOpen(false);
    setPrice(0);
    setMembershipType("")
    setMembershipPrice("")
  };

  // GENDER
  const handleChangeGender = (event) => {
    setGender(event.target.value);
  };

  const populateRoleInput = () => {
    fetch("https://gymerls-staging-server.vercel.app/api/roles")
      .then((response) => response.json())
      .then((data) => {
        const newData = data.filter((object) => {
          return object.id !== 1;
        });
        setRoles(newData);
      });
  };

  const createUser = (e) => {
    e.preventDefault();

    if (height != 0 && weight != 0 && minAgeAlert == true) {
      Swal.fire({
        icon: "info",
        title: "Are you sure you want to create new account?",
        text: "You won't be able to revert this!",
        showCancelButton: true,
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        allowOutsideClick: false,
      }).then((result) => {
        if (result.isConfirmed) {
          fetch("https://gymerls-staging-server.vercel.app/api/register", {
            method: "POST",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              name: fullname,
              username: username,
              role: selectedRole,
              isActive: 1,
              password: (Math.random() + 1).toString(36).substring(4),
            }),
          })
            .then((res) => res.json())
            .then((result) => {
              setHeight(0);
              setWeight(0);
              createUserProfile();
              userLog(
                localStorage.getItem("username"),
                "Create",
                "new user",
                username
              );
              Swal.fire({
                title: "User successfully created!",
                icon: "success",
                showConfirmButton: false,
                timer: 1500,
              }).then(function () {
                setIsBtnLoading(false);
                setOpen(false);
                setIsLoading(true);
                window.location.reload(false);
                setAge(0);
                setHeight(0);
                setWeight(0);
              });
            });
        } else {
          setIsBtnLoading(false);
        }
      });
    } else {
      Swal.fire({
        icon: "info",
        title: "Please double check the application form",
        showCancelButton: false,
        confirmButtonText: "OK",
        cancelButtonText: "No",
        allowOutsideClick: false,
      });
    }
  };

  const formatDate = (date) => {
    var dateToFormat = new Date(date);
    var year = dateToFormat.toLocaleString("default", { year: "numeric" });
    var month = dateToFormat.toLocaleString("default", { month: "2-digit" });
    var day = dateToFormat.toLocaleString("default", { day: "2-digit" });

    var formattedDate = year + "-" + month + "-" + day;
    return formattedDate;
  };

  const validateUser = (username) => {
    setUsernameIsValid(true);
    setcreateButtonIsDisabled(true);
    setIsVisible(true);
    if (username.length >= 5) {
      fetch("https://gymerls-staging-server.vercel.app/api/validate-user", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: username,
        }),
      })
        .then((res) => res.json())
        .then((result) => {
          if (result.length === 0) {
            setUsernameIsValid(true);
            setcreateButtonIsDisabled(false);
            setIsVisible(false);
          } else {
            setUsernameIsValid(false);
            setcreateButtonIsDisabled(true);
            setIsVisible(false);
          }
        });
    }
  };

  const createUserProfile = () => {
    const formattedBirthdate = formatDate(birthdate);
    const formattedStartDate = formatDate(startDate);
    const formattedEndDate = formatDate(endDate);

    fetch("https://gymerls-staging-server.vercel.app/api/create-user-profile", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        username: username,
        birthdate: formattedBirthdate,
        age: age,
        height: height,
        weight: weight,
        gender: gender,
        contact: contact,
        address: address,
        medical_conditions: medicalConditions,
        allergies: allergies,
        current_medication: currentMedication,
        family_doctor: familyDoctor,
        doctor_contact: doctorContact,
        parent_name: parentName,
        parent_contact: parentContact,
        parent_address: parentAddress,
        membership_type: membershipType,
        price: price,
        mem_start_date: formattedStartDate,
        mem_end_date: formattedEndDate,
        added_by: localStorage.getItem("username"),
      }),
    })
      .then((res) => res.json())
      .then((result) => {});
  };

  //formatter to compute the date
  const dateFormatter = (date) => {
    var dateToFormat = new Date(date);
    var year = dateToFormat.toLocaleString("default", { year: "numeric" });
    var month = dateToFormat.toLocaleString("default", { month: "2-digit" });
    var day = dateToFormat.toLocaleString("default", { day: "2-digit" });

    var formattedDate = month + "/" + day + "/" + year;
    return formattedDate;
  };

  useEffect(() => {
    // setHeight(0);
    // setWeight(0);
    const currentDate = formatDate(new Date());
    handleSubscription();
    handleExpiration();

    if (membershipType === "Monthly" || membershipType === "Premium") {
      setStartDate(dayjs(new Date()));
      const startDd = dayjs(new Date());
      const updatedDate = dayjs(startDd).add(1, "month");
      setEndtDate(updatedDate);
    } else {
      setStartDate(null);
      setEndtDate(null);
    }

    const timer = setTimeout(() => {
      fetch("https://gymerls-staging-server.vercel.app/api/users")
        .then((response) => response.json())
        .then((data) => {
          setFilteredList(data);
          setUsers(data);
          setIsLoading(false);
          if (data.length !== 0) {
            var monthlyPrice = data.filter(
              (e) =>
                e.date_added.slice(0, 4) >= currentDate.slice(0, 4) &&
                e.date_added.slice(5, 7) === currentDate.slice(5, 7)
            );
            let t = 0;
            monthlyPrice.map((e) => {
              t = t + e.price;
            });
            setTotalSale(t);
            setFilteredList(monthlyPrice);
            setTableHasNoData(false);
          } else {
            setTableHasNoData(true);
          }
        });
    }, 1000);
    return () => clearTimeout(timer);
  }, [membershipType]);

  const handlePriceMembership = (e) => {
    for (let item of membership)
      if (item.name == e) {
        const pesoFormat = new Intl.NumberFormat("fil-PH", {
          style: "currency",
          currency: "PHP",
        }).format(item.price);
        setPrice(item.price);
        setMembershipPrice(pesoFormat);
      }
  };

  const handleSubscription = () => {
    fetch("https://gymerls-staging-server.vercel.app/api/get-membership")
      .then((response) => response.json())
      .then((data) => {
        let memData = [];
        for (let item of data) {
          if (item.status == 1) {
            memData.push(item);
          }
        }
        setMembershipData(memData);
      });
  };

  const StyledTableRow = styled(TableRow)(({ theme }) => ({
    "&:nth-of-type(odd)": {
      backgroundColor: theme.palette.action.hover,
    },
    // hide last border
    "&:last-child td, &:last-child th": {
      border: 0,
    },
  }));

  const handleClickOpenModalUpdate = (user_name) => {
    setOpenModalUpdate(true);
    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-user-by-username",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: user_name,
        }),
      }
    )
      .then((res) => res.json())
      .then((result) => {
        const pesoFormat = new Intl.NumberFormat("fil-PH", {
          style: "currency",
          currency: "PHP",
        }).format(result[0].price);

        const bdate = formatDate(result[0].birthdate);
        const startDate = formatDate(result[0].mem_start_date);
        const endDate = formatDate(result[0].mem_end_date);
        setPrice(pesoFormat);
        setFullname(result[0].name);
        setUpdateBirthdate(bdate);
        setAge(result[0].age);
        setWeight(result[0].weight);
        setHeight(result[0].height);
        setContact(result[0].contact);
        setGender(result[0].gender);
        setAddress(result[0].address);

        setMedicalConditions(result[0].medical_conditions);
        setAllergies(result[0].allergies);
        setCurrentMedication(result[0].current_medication);
        setFamilyDoctor(result[0].family_doctor);
        setDoctorContact(result[0].doctor_contact);

        setParentName(result[0].parent_name);
        setParentContact(result[0].parent_contact);
        setParentAddress(result[0].parent_address);

        setMembershipType(result[0].membership_type);
        setMembershipPrice(pesoFormat);
        setUpdateStartDate(startDate);
        setUpdateEndDate(endDate);

        setUsername(result[0].username);
      });
  };

  const updateUser = () => {
    // setIsBtnLoading(true);
    const birthdateFormatted = formatDate(updateBirthdate);
    const startDateFormatted = formatDate(updateStartDate);
    const endDateFormatted = formatDate(updateEndDate);

    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update this account?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        fetch("https://gymerls-staging-server.vercel.app/api/update-user", {
          method: "PATCH",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            name: fullname,
            birthdate: birthdateFormatted,
            age: age,
            weight: weight,
            height: height,
            contact: contact,
            gender: gender,
            address: address,
            medical_conditions: medicalConditions,
            allergies: allergies,
            current_medication: currentMedication,
            family_doctor: familyDoctor,
            doctor_contact: doctorContact,
            parent_name: parentName,
            parent_contact: parentContact,
            parent_address: parentAddress,
            membership_type: membershipType,
            price: price,
            mem_start_date: startDateFormatted,
            mem_end_date: endDateFormatted,
            username: username,
          }),
        })
          .then((res) => res.json())
          .then((result) => {
            setPrice(0);
            setHeight(0);
            setWeight(0);
            userLog(
              localStorage.getItem("username"),
              "Update",
              "user",
              username
            );
            Swal.fire({
              title: "User successfully updated!",
              icon: "success",
              showConfirmButton: false,
              timer: 1500,
            }).then(function () {
              setOpenModalUpdate(false);
              setIsBtnLoading(false);
              window.location.reload(false);
            });
          });
      } else {
        setIsBtnLoading(false);
      }
    });
  };
  //BMI CALCULATOR
  const calculateBmi = (height, weight, age) => {
    if (height && weight) {
      const heightInMeters = height / 100;
      const bmi = (weight / (heightInMeters * heightInMeters)).toFixed(2);
      setBmiValue(bmi);

      let classColor = "";
      let bmiGet = "";
      let message = "";
      if (bmi < 16) {
        message = "Severe Thinnes";
        bmiGet = "<" + 16;
        classColor = "#bc2020";
      } else if (bmi >= 16 && bmi < 17) {
        message = "Moderate Thinnes";
        bmiGet = 16 + " to " + 17;
        classColor = "#d38888";
      } else if (bmi >= 17 && bmi < 18.5) {
        bmiGet = 17 + " to " + 18.5;
        message = "Mild Thinnes";
        classColor = "#ffe400";
      } else if (bmi >= 18.5 && bmi < 25) {
        bmiGet = 18.5 + " to " + 25;
        message = "Normal";
        classColor = "#008137";
      } else if (bmi >= 25 && bmi < 30) {
        bmiGet = 25 + " to " + 30;
        message = "Overweight";
        classColor = "#ffe400";
      } else if (age >= 21 && bmi >= 30 && bmi < 35) {
        bmiGet = 30 + " to " + 35;
        message = "Obeses Class I";
        classColor = "#d38888";
      } else if (age >= 21 && bmi >= 35 && bmi < 40) {
        bmiGet = 35 + " to " + 40;
        message = "Obeses Class II";
        classColor = "#bc2020";
      } else if (age >= 21 && bmi >= 40) {
        bmiGet = ">" + 40;
        message = "Obeses Class III";
        classColor = "#8a0101";
      } else {
        bmiGet = 0;
        message = "No data";
        classColor = "black";
      }
      setBmiMessage(message);
      handleGetDataByBmi(bmiGet);
      setClasssificationColor(classColor);
    } else {
      setBmiValue("");
      setBmiMessage("");
    }
  };

  //HANDLE NO COMPATIBLE READY MEAL
  const handleNoCompatibleMeal = () => {
    setRecommendedMeals([
      {
        id: 1,
        diet_type: "No diet available",
      },
    ]);
    setBmiMessage("No data");
    setBmiValue("0");
    setHasMealPlan(true);
    setSundayBreakfast("No data");
    setSundayLunch("No data");
    setSundayDinner("No data");
    setMondayBreakfast("No data");
    setMondayLunch("No data");
    setMondayDinner("No data");
    setTuesdayBreakfast("No data");
    setTuesdayLunch("No data");
    setTuesdayDinner("No data");
    setWednesdayBreakfast("No data");
    setWednesdayLunch("No data");
    setWednesdayDinner("No data");
    setThursdayBreakfast("No data");
    setThursdayLunch("No data");
    setThursdayDinner("No data");
    setFridayBreakfast("No data");
    setFridayLunch("No data");
    setFridayDinner("No data");
    setSaturdayBreakfast("No data");
    setSaturdayLunch("No data");
    setSaturdayDinner("No data");
  };

  const handleGetDataByBmi = (bmiGet) => {
    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-ready-meal-by-bmi",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          bmi: bmiGet,
        }),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        setRecommendedMeals(data);
        for (let item of data) {
          if (item.status === 1) {
            if (item.length !== 0) {
            } else {
              setRecommendedMeals(dietType);
            }
          }
        }
      });
  };
  const handleOpenModalMealPlanning = (username) => {
    setMealPlanUser(username);
    setOpenModalMealPlanning(true);

    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-user-by-username",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: username,
        }),
      }
    )
      .then((res) => res.json())
      .then((result) => {
        for (let item of result) {
          if (
            (item.height != 0 && item.weight != 0) ||
            (item.height != 0 && item.weight != 0)
          ) {
            calculateBmi(result[0].height, result[0].weight, result[0].age);
          } else {
            handleNoCompatibleMeal();
          }
        }
      });

    fetch("https://gymerls-staging-server.vercel.app/api/meal-plan", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        username: username,
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.length !== 0) {
          setHasMealPlan(true);

          setTypeDiet(data[0].diet_type);
          setTotalCalories(data[0].calories);

          setSundayBreakfast(data[0].sun_bf_meal);
          setSundayLunch(data[0].sun_lunch_meal);
          setSundayDinner(data[0].sun_dinner_meal);

          setMondayBreakfast(data[0].mon_bf_meal);
          setMondayLunch(data[0].mon_lunch_meal);
          setMondayDinner(data[0].mon_dinner_meal);

          setTuesdayBreakfast(data[0].tue_bf_meal);
          setTuesdayLunch(data[0].tue_lunch_meal);
          setTuesdayDinner(data[0].tue_dinner_meal);

          setWednesdayBreakfast(data[0].wed_bf_meal);
          setWednesdayLunch(data[0].wed_lunch_meal);
          setWednesdayDinner(data[0].wed_dinner_meal);

          setThursdayBreakfast(data[0].thurs_bf_meal);
          setThursdayLunch(data[0].thurs_lunch_meal);
          setThursdayDinner(data[0].thurs_dinner_meal);

          setFridayBreakfast(data[0].fri_bf_meal);
          setFridayLunch(data[0].fri_lunch_meal);
          setFridayDinner(data[0].fri_dinner_meal);

          setSaturdayBreakfast(data[0].sat_bf_meal);
          setSaturdayLunch(data[0].sat_lunch_meal);
          setSaturdayDinner(data[0].sat_dinner_meal);
        } else {
          setHasMealPlan(false);
        }
      });
  };

  const handleCloseModalMealPlanning = () => {
    setTypeDiet("");
    setTotalCalories("");
    setSundayBreakfast("");
    setSundayLunch("");
    setSundayDinner("");
    setMondayBreakfast("");
    setMondayLunch("");
    setMondayDinner("");
    setTuesdayBreakfast("");
    setTuesdayLunch("");
    setTuesdayDinner("");
    setWednesdayBreakfast("");
    setWednesdayLunch("");
    setWednesdayDinner("");
    setThursdayBreakfast("");
    setThursdayLunch("");
    setThursdayDinner("");
    setFridayBreakfast("");
    setFridayLunch("");
    setFridayDinner("");
    setSaturdayBreakfast("");
    setSaturdayLunch("");
    setSaturdayDinner("");
    setBmiMessage("");
    setBmiValue("");
    setOpenModalMealPlanning(false);
    setClasssificationColor("black");
  };

  const createMealPlan = (event) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);

    setIsBtnLoading(true);

    fetch(
      "https://gymerls-staging-server.vercel.app/api/create-meal-planning",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: mealPlanUser,
          diet_type: data.get("diet_type"),
          calories: data.get("total_calories"),
          sun_bf_meal: data.get("sunday_breakfast"),
          sun_lunch_meal: data.get("sunday_lunch"),
          sun_dinner_meal: data.get("sunday_dinner"),
          mon_bf_meal: data.get("monday_breakfast"),
          mon_lunch_meal: data.get("monday_lunch"),
          mon_dinner_meal: data.get("monday_dinner"),
          tue_bf_meal: data.get("tuesday_breakfast"),
          tue_lunch_meal: data.get("tuesday_lunch"),
          tue_dinner_meal: data.get("tuesday_dinner"),
          wed_bf_meal: data.get("wednesday_breakfast"),
          wed_lunch_meal: data.get("wednesday_lunch"),
          wed_dinner_meal: data.get("wednesday_dinner"),
          thurs_bf_meal: data.get("thursday_breakfast"),
          thurs_lunch_meal: data.get("thursday_lunch"),
          thurs_dinner_meal: data.get("thursday_dinner"),
          fri_bf_meal: data.get("friday_breakfast"),
          fri_lunch_meal: data.get("friday_lunch"),
          fri_dinner_meal: data.get("friday_dinner"),
          sat_bf_meal: data.get("saturday_breakfast"),
          sat_lunch_meal: data.get("saturday_lunch"),
          sat_dinner_meal: data.get("saturday_dinner"),
        }),
      }
    )
      .then((res) => res.json())
      .then((result) => {
        userLog(
          localStorage.getItem("username"),
          "Create",
          "meal plan for",
          mealPlanUser
        );

        Swal.fire({
          title: "Meal plan successfully created!",
          icon: "success",
          showConfirmButton: false,
          timer: 1500,
        }).then(function () {
          setOpenModalMealPlanning(false);
          setIsBtnLoading(false);
          window.location.reload(false);
        });
      });
  };

  const updateMealPlan = (event) => {
    event.preventDefault();
    setIsBtnLoading(true);
    const data = new FormData(event.currentTarget);
    if (bmiMessage == "No data" || recommendedMeals == "No diet available") {
      console.log("No diet available");
      Swal.fire({
        icon: "info",
        title: "Plss select valid diet type",
        showCancelButton: false,
        confirmButtonText: "OK",
        allowOutsideClick: false,
      }).then((result) => {
        if (result.isConfirmed) {
          setIsBtnLoading(false);
          handleCloseModalMealPlanning();
        }
      });
    } else {
      console.log(data);
      Swal.fire({
        icon: "info",
        title: "Are you sure you want to update this account?",
        text: "You won't be able to revert this!",
        showCancelButton: true,
        confirmButtonText: "Yes",
        cancelButtonText: "No",
        allowOutsideClick: false,
      }).then((result) => {
        if (result.isConfirmed) {
          fetch(
            "https://gymerls-staging-server.vercel.app/api/update-meal-planning",
            {
              method: "PATCH",
              headers: {
                "Content-type": "application/json",
              },
              body: JSON.stringify({
                diet_type: data.get("diet_type"),
                calories: data.get("total_calories"),
                sun_bf_meal: data.get("sunday_breakfast"),
                sun_lunch_meal: data.get("sunday_lunch"),
                sun_dinner_meal: data.get("sunday_dinner"),
                mon_bf_meal: data.get("monday_breakfast"),
                mon_lunch_meal: data.get("monday_lunch"),
                mon_dinner_meal: data.get("monday_dinner"),
                tue_bf_meal: data.get("tuesday_breakfast"),
                tue_lunch_meal: data.get("tuesday_lunch"),
                tue_dinner_meal: data.get("tuesday_dinner"),
                wed_bf_meal: data.get("wednesday_breakfast"),
                wed_lunch_meal: data.get("wednesday_lunch"),
                wed_dinner_meal: data.get("wednesday_dinner"),
                thurs_bf_meal: data.get("thursday_breakfast"),
                thurs_lunch_meal: data.get("thursday_lunch"),
                thurs_dinner_meal: data.get("thursday_dinner"),
                fri_bf_meal: data.get("friday_breakfast"),
                fri_lunch_meal: data.get("friday_lunch"),
                fri_dinner_meal: data.get("friday_dinner"),
                sat_bf_meal: data.get("saturday_breakfast"),
                sat_lunch_meal: data.get("saturday_lunch"),
                sat_dinner_meal: data.get("saturday_dinner"),
                username: mealPlanUser,
              }),
            }
          )
            .then((res) => res.json())
            .then((result) => {
              userLog(
                localStorage.getItem("username"),
                "Update",
                "meal plan for",
                mealPlanUser
              );
              Swal.fire({
                title: "Meal plan successfully updated!",
                icon: "success",
                showConfirmButton: false,
                timer: 1500,
              }).then(function () {
                setOpenModalMealPlanning(false);
                setIsBtnLoading(false);
                window.location.reload(false);
              });
            });
        } else if (result.isDenied) {
          setIsBtnLoading(false);
        }
      });
    }
  };

  const handleOpenModalUpdatePassword = (username, password) => {
    setPasswordButton(true);
    setSelectedUser(username);
    setSelectedUserPassword(password);
    setOpenModalUpdatePassword(true);
  };

  const updatePassword = (event) => {
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    setIsBtnLoading(true);

    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update the password to this user?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        fetch("https://gymerls-staging-server.vercel.app/api/update-password", {
          method: "PATCH",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            password: data.get("newPassword"),
            username: selectedUser,
          }),
        })
          .then((res) => res.json())
          .then((result) => {
            userLog(
              localStorage.getItem("username"),
              "Update",
              "password of user",
              selectedUser
            );

            Swal.fire({
              title: "Password successfully updated!",
              icon: "success",
              showConfirmButton: false,
              timer: 1500,
            }).then(function () {
              setOpenModalUpdatePassword(false);
              setIsBtnLoading(false);
              window.location.reload(false);
            });
          });
      } else {
        setIsBtnLoading(false);
      }
    });
  };

  const changeUserStatus = (status, username) => {
    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update the status to this user?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        setIsBtnLoading(true);
        handleUserStatus(status, username);
      } else {
        window.location.reload(false);
      }
    });
  };

  const handleExpiration = () => {
    fetch("https://gymerls-staging-server.vercel.app/api/all-user-profile", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        for (let item of data) {
          getDaysDifference(item.mem_end_date, item.username);
        }
      });
  };

  const getDaysDifference = (end_date, username) => {
    const dateNow = new Date();
    var date1 = new Date(formatDate(dateNow));
    var date2 = new Date(formatDate(end_date));

    // To calculate the time difference of two dates
    var Difference_In_Time = date2.getTime() - date1.getTime();

    // To calculate the no. of days between two dates
    var result = Difference_In_Time / (1000 * 3600 * 24);

    //the final no. of days (result)
    // setMembershipEnd(result);
    if (1 > result) {
      fetch(
        "https://gymerls-staging-server.vercel.app/api/update-user-status",
        {
          method: "PATCH",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            isActive: 0,
            username: username,
          }),
        }
      );
    } else {
      fetch(
        "https://gymerls-staging-server.vercel.app/api/update-user-status",
        {
          method: "PATCH",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            isActive: 1,
            username: username,
          }),
        }
      );
    }
  };

  const handleUserStatus = (status, username) => {
    fetch("https://gymerls-staging-server.vercel.app/api/update-user-status", {
      method: "PATCH",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        isActive: status ? 1 : 0,
        username: username,
      }),
    })
      .then((res) => res.json())
      .then((data) => {
        userLog(
          localStorage.getItem("username"),
          "Change",
          "status of user",
          username
        );

        Swal.fire({
          title: "User status successfully updated!",
          icon: "success",
          showConfirmButton: false,
          timer: 1500,
        }).then(function () {
          setIsBtnLoading(false);
          window.location.reload(false);
        });
      });
  };
  const [filteredList, setFilteredList] = new useState(users);

  const filterBySearch = (e) => {
    const results = users.filter((user) => {
      if (e.target.value === "") return users;
      return user.username.toLowerCase().includes(e.target.value.toLowerCase());
    });
    setFilteredList(results);
  };

  const deleteUser = (username) => {
    Swal.fire({
      icon: "warning",
      title: "Are you sure you want to delete this account?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        userLog(
          localStorage.getItem("username"),
          "Delete",
          "account",
          username
        );

        // DELETE IN USERS TABLE
        fetch("https://gymerls-staging-server.vercel.app/api/delete-user", {
          method: "PATCH",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            username: username,
          }),
        }).then((res) => res.json());

        // DELETE IN USER_PROFILE TABLE
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-user-profile",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
            }),
          }
        ).then((res) => res.json());

        // DELETE IN MEAL_PLAN TABLE
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-user-meal-plan",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
            }),
          }
        ).then((res) => res.json());

        // DELETE IN TRANSACTION TABLE
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-user-transaction",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
            }),
          }
        ).then((res) => res.json());

        // DELETE IN RESERVATION TABLE
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-user-reservation",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
            }),
          }
        ).then((res) => res.json());

        // DELETE IN CART TABLE
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-user-cart",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              username: username,
            }),
          }
        ).then((res) => res.json());

        Swal.fire({
          title: "User successfully deleted!",
          icon: "success",
          showConfirmButton: false,
          timer: 1500,
        }).then(function () {
          window.location.reload(false);
        });
      } else {
        setIsBtnLoading(false);
      }
    });
  };

  const getIpAddress = (callback) => {
    fetch("https://api.ipify.org?format=json")
      .then((response) => response.json())
      .then((data) => callback(data.ip))
      .catch((error) => console.log(error));
  };

  const userLog = (author, action, event, user) => {
    getIpAddress(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/insert-log", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: author,
          event_info: `${action} - ${event} "${user}"`,
          ip_address: callback,
          platform: window.navigator.userAgentData.platform,
        }),
      }).catch((error) => console.log(error));
    });
  };

  const downloadPdf = () => {
    const doc = new jsPDF();
    doc.text("List of User", 20, 10);
    doc.autoTable({ html: "#userTable" });
    doc.text("Grand Total : " + "Php " + pesoFormat.slice(1, 10), 15, 280);
    doc.text("_________________", 15, 281);
    doc.save("users.pdf");
  };

  //HANDLE ONCHANGE DIET UPDATE
  const handleOnchangeUpdateDiet = (e) => {
    for (let item of recommendedMeals) {
      if (item.diet_type == e) {
        //CREATE MEAL DATA
        setSundayBreakfast(item.ready_sunday_breakfast);
        setSundayLunch(item.ready_sunday_lunch);
        setSundayDinner(item.ready_sunday_dinner);
        setMondayBreakfast(item.ready_monday_breakfast);
        setMondayLunch(item.ready_monday_lunch);
        setMondayDinner(item.ready_sunday_dinner);
        setTuesdayBreakfast(item.ready_tuesday_breakfast);
        setTuesdayLunch(item.ready_tuesday_lunch);
        setTuesdayDinner(item.ready_tuesday_dinner);
        setWednesdayBreakfast(item.ready_wednesday_breakfast);
        setWednesdayLunch(item.ready_wednesday_lunch);
        setWednesdayDinner(item.ready_wednesday_dinner);
        setThursdayBreakfast(item.ready_thursday_breakfast);
        setThursdayLunch(item.ready_thursday_lunch);
        setThursdayDinner(item.ready_thursday_dinner);
        setFridayBreakfast(item.ready_friday_breakfast);
        setFridayLunch(item.ready_friday_lunch);
        setFridayDinner(item.ready_friday_dinner);
        setSaturdayBreakfast(item.ready_saturday_breakfast);
        setSaturdayLunch(item.ready_saturday_lunch);
        setSaturdayDinner(item.ready_saturday_dinner);
      }
    }
  };

  //HANDLE ONCHANGE DIET TYPE
  const handleOnchangeDiet = (e) => {
    for (let item of recommendedMeals) {
      if (item.diet_type == e) {
        //CREATE MEAL DATA
        setSundayReadyBreakfast(item.ready_sunday_breakfast);
        setSundayReadyLunch(item.ready_sunday_lunch);
        setSundayReadyDinner(item.ready_sunday_dinner);
        setMondayReadyBreakfast(item.ready_monday_breakfast);
        setMondayReadyLunch(item.ready_monday_lunch);
        setMondayReadyDinner(item.ready_sunday_dinner);
        setTuesdayReadyBreakfast(item.ready_tuesday_breakfast);
        setTuesdayReadyLunch(item.ready_tuesday_lunch);
        setTuesdayReadyDinner(item.ready_tuesday_dinner);
        setWednesdayReadyBreakfast(item.ready_wednesday_breakfast);
        setWednesdayReadyLunch(item.ready_wednesday_lunch);
        setWednesdayReadyDinner(item.ready_wednesday_dinner);
        setThursdayReadyBreakfast(item.ready_thursday_breakfast);
        setThursdayReadyLunch(item.ready_thursday_lunch);
        setThursdayReadyDinner(item.ready_thursday_dinner);
        setFridayReadyBreakfast(item.ready_friday_breakfast);
        setFridayReadyLunch(item.ready_friday_lunch);
        setFridayReadyDinner(item.ready_friday_dinner);
        setSaturdayReadyBreakfast(item.ready_saturday_breakfast);
        setSaturdayReadyLunch(item.ready_saturday_lunch);
        setSaturdayReadyDinner(item.ready_saturday_dinner);
      }
    }
  };

  // TOTAL SUBS SALES
  const handleSubsSales = () => {
    let data = [];
    for (let e of users) {
      data.push(e);
    }
    const stats = data.filter((data) => data.isActive === 1);
    let dateStart = startDateRange.format();
    let dateEnd = endDateRange.format();
    const [sYear, sMonth, sDay] = dateStart.split("-");
    const [eYear, eMonth, eDay] = dateEnd.split("-");

    let sdayNumber = Number(sDay.slice(0, 2)) - 1;
    let edayNumber = Number(eDay.slice(0, 2)) - 1;

    const startDateFiltered = new Date(sYear, +sMonth - 1, sdayNumber);
    const endDateFiltered = new Date(
      eYear,
      +eMonth - 1,
      edayNumber,
      23,
      59,
      59,
      999
    );
    var result = data.filter(
      (e) =>
        new Date(e.date_added.slice(0, 10) + " " + "00:00:00") >=
          startDateFiltered &&
        new Date(e.date_added.slice(0, 10) + " " + "00:00:00") <=
          endDateFiltered
    );
    result.length === 0 ? setTableHasNoData(true) : setTableHasNoData(false);
    setFilteredList(result);
    // var complete = result.filter((e) => e.isActive === 1 || 0);
    let t = 0;
    result.map(({ price }) => (t = t + price));
    setTotalSale(t);
  };

  const filteredByDate = (e) => {
    const date = e.format();
    const [sYear, sMonth, sDay] = date.split("-");
    let dateNumber = Number(sDay.slice(0, 2)) - 1;
    const complete = users.filter(
      (e) => e.date_added.slice(0, 10) === date.slice(0, 8) + dateNumber
    );
    if (complete.length == 0) {
      setTableHasNoData(true);
    } else {
      setTableHasNoData(false);
      setFilteredList(complete);
    }
  };
  const pesoFormat = new Intl.NumberFormat("fil-PH", {
    style: "currency",
    currency: "PHP",
  }).format(totalSale);
  const handleCloseUpdateModal = () => {
    setBmiMessage("");
    setBmiValue("");
    setOpenModalUpdate(false);
    setPrice(0);
    setHeight("");
    setWeight("");
    setMembershipPrice("");
    setAge("");
    setMembershipType("");
  };

  const changeRole = (value) => {
    if (value == "admin") {
      setAdminRole(false);
    } else setAdminRole(true);
  };

  return (
    <>
      {isLoading ? (
        <div>
          <Backdrop
            sx={{ color: "#fff", zIndex: (theme) => theme.zIndex.drawer + 1 }}
            open={true}
          >
            <CircularProgress color="inherit" />
          </Backdrop>
        </div>
      ) : (
        <div>
          <Grid container>
            <Grid item xs={3} md={2}>
              <Button variant="outlined" onClick={handleClickOpen}>
                Create new user
              </Button>
            </Grid>
            <Grid
              item
              xs={5}
              sx={{ display: "flex", alignItems: "center", columnGap: "1rem" }}
            >
              <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DatePicker
                  label="Date start"
                  margin="dense"
                  format="YYYY-MM-DD"
                  sx={{ width: "30%" }}
                  value={startDateRange}
                  onChange={(newValue) => {
                    setTotalSale("0");
                    filteredByDate(newValue);
                    setStartDateRange(newValue);
                  }}
                  renderInput={(params) => <TextField {...params} />}
                />
              </LocalizationProvider>

              <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DatePicker
                  label="Date End"
                  margin="dense"
                  format="YYYY-MM-DD"
                  sx={{ width: "30%" }}
                  value={endDateRange}
                  onChange={(newValue) => {
                    setTotalSale("0");
                    setEndDateRange(newValue);
                  }}
                  renderInput={(params) => <TextField {...params} />}
                />
              </LocalizationProvider>
              <Button onClick={handleSubsSales}>
                <Typography
                  sx={{
                    fontWeight: "400",
                    fontSize: "1.3rem",
                  }}
                >
                  Go
                </Typography>
              </Button>
            </Grid>
            <Grid item xs={6} md={4}>
              <TextField
                label="Search username"
                onChange={filterBySearch}
                fullWidth
              />
            </Grid>
            <Grid item xs={12} display={"flex"}>
              <Grid>
                <Button onClick={() => downloadPdf()} startIcon={<PrintIcon />}>
                  Export as PDF
                </Button>
              </Grid>
            </Grid>
          </Grid>

          {/* CREATE NEW USER */}
          <Dialog
            fullScreen={fullScreen}
            open={open}
            aria-labelledby="responsive-dialog-title"
          >
            <DialogTitle id="responsive-dialog-title">
              {"CREATE NEW USER"}
            </DialogTitle>
            <DialogContent>
              <DialogContentText>
                Fill up all fields, type <strong>n/a</strong> if not applicable.
              </DialogContentText>
              <Typography variant="h6">Personal information</Typography>
              <TextField
                id="name"
                label="Name"
                margin="normal"
                onChange={(e) => {
                  setFullname(e.target.value);
                }}
                autoFocus
                required
                fullWidth
              />
              <TextField
                id="username"
                label="Username"
                margin="dense"
                helperText="Username must be 5 characters and above"
                onChange={(e) => {
                  setUsername(e.target.value);
                  validateUser(e.target.value);
                }}
                required
                fullWidth
              />

              {usernameIsValid ? (
                <Typography
                  variant="caption"
                  margin="normal"
                  hidden={isVisible}
                  sx={{ fontSize: "0.8rem", color: "green" }}
                >
                  Username is available
                </Typography>
              ) : (
                <Typography
                  variant="caption"
                  margin="normal"
                  hidden={isVisible}
                  sx={{ fontSize: "0.8rem", color: "#ae1919" }}
                >
                  Username is taken
                </Typography>
              )}

              <Grid container spacing={2}>
                <Grid item xs={4}>
                  <TextField
                    id="standard-select-role"
                    select
                    fullWidth
                    margin="normal"
                    label="Role"
                    value={selectedRole}
                    onChange={(e) => {
                      setSelectedRole(e.target.value);
                      changeRole(e.target.value);
                    }}
                    defaultValue={"user"}
                    helperText="Please select role"
                  >
                    {roles.map((option) => (
                      <MenuItem key={option.id} value={option.value}>
                        {option.value}
                      </MenuItem>
                    ))}
                  </TextField>
                </Grid>
                <Grid
                  item
                  xs={4}
                  sx={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <TextField
                    id="standard-input-height"
                    margin="normal"
                    label="Height"
                    type="number"
                    value={height}
                    onChange={(e) => {
                      setHeight(e.target.value);
                    }}
                    defaultValue={"user"}
                    helperText="Please put valid height"
                    InputProps={{
                      endAdornment: (
                        <InputAdornment
                          position="end"
                          sx={{
                            marginLeft: ".3rem",
                          }}
                        >
                          cm
                        </InputAdornment>
                      ),
                    }}
                  />
                </Grid>
                <Grid
                  item
                  xs={4}
                  sx={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                  }}
                >
                  <TextField
                    id="standard-input-weight"
                    margin="normal"
                    label="Weight"
                    type="number"
                    helperText="Please put valid weight"
                    value={weight}
                    onChange={(e) => {
                      setWeight(e.target.value);
                    }}
                    InputProps={{
                      endAdornment: (
                        <InputAdornment
                          position="end"
                          sx={{ marginLeft: ".3rem" }}
                        >
                          kg
                        </InputAdornment>
                      ),
                    }}
                  />
                </Grid>
              </Grid>
              <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DatePicker
                  label="Birthdate *"
                  format="YYYY-MM-DD"
                  sx={{ width: "100%" }}
                  value={birthdate}
                  onChange={(newValue) => {
                    setBirthdate(newValue);
                    const formatBdate = formatDate(newValue);
                    dayjs.extend(relativeTime);

                    var newDate = dayjs(formatBdate).fromNow(true);
                    const validationYr = new Date(newValue).toLocaleDateString('en-us' ,{year:"numeric"})
                    let firstWord = newDate.split(" ")[0];
                    var ages = parseFloat(firstWord);
                    if (17 <= ages) {
                      setMinAgeAlert(true);
                    } else {
                      setMinAgeAlert(false);
                    }
                   
                    if(validationYr <= new Date().toLocaleDateString('en-us', {year:"numeric"})-6 ){
                     setAge(ages)
                    }else{
                      setAge("")
                    }
                    // setAge(ages);
                  }}
                  renderInput={(params) => <TextField {...params} />}
                />
              </LocalizationProvider>
              <Grid container spacing={2}>
                <Grid item xs={6}>
                  <TextField
                    id="age"
                    label="Age"
                    margin="normal"
                    type="number"
                    value={age}
                    helperText="Minimum age is 17 and above"
                    onChange={(e) => {
                      setAge(e.target.value);
                    }}
                    required
                    disabled
                    fullWidth
                  />
                  {minAgeAlert ? (
                    <Typography
                      variant="caption"
                      margin="normal"
                      hidden={true}
                      sx={{ fontSize: "0.8rem", color: "green" }}
                    ></Typography>
                  ) : (
                    <Typography
                      variant="caption"
                      margin="normal"
                      sx={{ fontSize: "0.8rem", color: "#ae1919" }}
                    >
                      Minimum age should be 17 an above
                    </Typography>
                  )}
                </Grid>
                <Grid
                  item
                  xs={6}
                  sx={{
                    display: "flex",
                    justifyContent: "space-around",
                    alignItems: "center",
                  }}
                >
                  <div
                    style={{
                      display: "flex",
                      justifyContent: "center",
                      flexDirection: "column",
                    }}
                  >
                    {"Gender:"}
                  </div>
                  <Grid item sx={{ display: "flex", flexDirection: "column" }}>
                    <FormControlLabel
                      value="top"
                      control={
                        <Radio
                          color="default"
                          value="Male"
                          checked={gender === "Male"}
                          name="radio-buttons"
                          onChange={handleChangeGender}
                        />
                      }
                      label="Male"
                      labelPlacement="right"
                    />
                    <FormControlLabel
                      value="top"
                      control={
                        <Radio
                          color="default"
                          value="Female"
                          checked={gender === "Female"}
                          name="radio-buttons"
                          onChange={handleChangeGender}
                        />
                      }
                      label="Female"
                      labelPlacement="right"
                    />
                  </Grid>
                  {/* <Radio
                         checked={gender === "Male"}
                    onChange={handleChangeGender}
                    value="Male"
                    name="radio-buttons"
                    label="Male"
                    labelP
                  /> */}
                  {/* <Radio
                    checked={gender === "Female"}
                    onChange={handleChangeGender}
                    value="Female"
                    name="radio-buttons"
                    sx={
                      {
                        // color: "pink",
                        // "&.Mui-checked": {
                        //   color: "pink",
                        // },
                      }
                    }
                  /> */}
                </Grid>
              </Grid>
              <TextField
                id="contact"
                label="Contact no."
                margin="normal"
                onChange={(e) => {
                  setContact(e.target.value);
                }}
                required
                fullWidth
              />
              <TextField
                id="address"
                label="Address"
                margin="normal"
                fullWidth
                multiline
                rows={2}
                sx={{ marginBottom: "1rem" }}
                onChange={(e) => {
                  setAddress(e.target.value);
                }}
              />
              <Divider />
              {adminRole ? (
                <Container style={{ display: "", padding: 0 }}>
                  <Typography sx={{ marginTop: "1rem" }} variant="h6">
                    Medical information
                  </Typography>
                  <TextField
                    id="medical_conditions"
                    label="Medical conditions"
                    margin="normal"
                    fullWidth
                    multiline
                    rows={2}
                    onChange={(e) => {
                      setMedicalConditions(e.target.value);
                    }}
                  />
                  <TextField
                    id="allergies"
                    label="Allergies"
                    margin="normal"
                    fullWidth
                    multiline
                    rows={2}
                    onChange={(e) => {
                      setAllergies(e.target.value);
                    }}
                  />
                  <TextField
                    id="current_medications"
                    label="Current medications"
                    margin="normal"
                    fullWidth
                    multiline
                    rows={2}
                    onChange={(e) => {
                      setCurrentMedication(e.target.value);
                    }}
                  />
                  <TextField
                    id="doctor_name"
                    label="Doctor's name"
                    margin="normal"
                    onChange={(e) => {
                      setFamilyDoctor(e.target.value);
                    }}
                    required
                    fullWidth
                  />
                  <TextField
                    sx={{ marginBottom: "1rem" }}
                    id="doctor_contact"
                    label="Contact no."
                    margin="normal"
                    onChange={(e) => {
                      setDoctorContact(e.target.value);
                    }}
                    required
                    fullWidth
                  />
                  <Divider />
                  <Typography sx={{ marginTop: "1rem" }} variant="h6">
                    In case of emergency
                  </Typography>
                  <TextField
                    id="parent_name"
                    label="Parent's name"
                    margin="normal"
                    onChange={(e) => {
                      setParentName(e.target.value);
                    }}
                    required
                    fullWidth
                  />
                  <TextField
                    id="parent_contact"
                    label="Contact no."
                    margin="normal"
                    onChange={(e) => {
                      setParentContact(e.target.value);
                    }}
                    required
                    fullWidth
                  />
                  <TextField
                    id="parent_address"
                    label="Address"
                    margin="normal"
                    fullWidth
                    multiline
                    rows={2}
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      setParentAddress(e.target.value);
                    }}
                  />
                  <Divider />
                </Container>
              ) : (
                <Typography variant="h1" color="initial"></Typography>
              )}

              <Typography sx={{ marginTop: "1rem" }} variant="h6">
                Membership
              </Typography>
              <Grid container spacing={2}>
                <Grid item xs={6}>
                  <TextField
                    fullWidth
                    id="standard-select-membership"
                    select
                    margin="normal"
                    label="Membership"
                    value={membershipType}
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      handlePriceMembership(e.target.value);
                      setMembershipType(e.target.value);
                    }}
                    helperText="Please select membership"
                  >
                    {membership.map((option) => (
                      <MenuItem key={option.id} value={option.name}>
                        {option.name}
                      </MenuItem>
                    ))}
                  </TextField>
                </Grid>
                <Grid item xs={6}>
                  <TextField
                    fullWidth
                    id="standard-select-membership"
                    inputProps={{
                      readOnly: true,
                      disableUnderline: true,
                    }}
                    readOnly
                    margin="normal"
                    label="Price"
                    value={membershipPrice}
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      setMembershipPrice(e.target.value);
                    }}
                  ></TextField>
                </Grid>
              </Grid>
              {membershipType == "" ? (<Typography variant="h1" color="initial"></Typography>):(    <Grid container spacing={2}>
                <Grid item xs={6}>
                  <LocalizationProvider dateAdapter={AdapterDayjs}>
                    <DatePicker
                      label="Start date"
                      format="YYYY-MM-DD"
                      sx={{ width: "100%" }}
                      value={startDate}
                      onChange={(newValue) => {
                        setStartDate(newValue);
                        if (
                          membershipType === "Monthly" ||
                          membershipType === "Premium"
                        ) {
                          setEndtDate(newValue);
                          const startDd = newValue;
                          const updatedDate = dayjs(startDd).add(1, "month");
                          setEndtDate(updatedDate);
                        }
                      }}
                      renderInput={(params) => <TextField {...params} />}
                    />
                  </LocalizationProvider>
                </Grid>
                <Grid item xs={6}>
                  <LocalizationProvider dateAdapter={AdapterDayjs}>
                    <DatePicker
                      label="End date *"
                      format="YYYY-MM-DD"
                      sx={{ width: "100%" }}
                      value={endDate}
                      onChange={(newValue) => {
                        setEndtDate(newValue);
                      }}
                      renderInput={(params) => <TextField {...params} />}
                    />
                  </LocalizationProvider>
                </Grid>
              </Grid>)}
            </DialogContent>
            <DialogActions>
              <Button variant="contained" color="error" onClick={handleClose}>
                CANCEL
              </Button>
              <LoadingButton
                onClick={createUser}
                variant="contained"
                disabled={createButtonIsDisabled}
                loading={isBtnLoading}
              >
                <span>CREATE</span>
              </LoadingButton>
            </DialogActions>
          </Dialog>

          {/* UPDATE USER */}
          <Dialog
            fullScreen={modalWidth}
            open={openModalUpdate}
            aria-labelledby="responsive-dialog-title"
          >
            <DialogTitle id="responsive-dialog-title">
              {"UPDATE USER"}
            </DialogTitle>
            <DialogContent>
              <DialogContentText>
                Fill up all fields, type <strong>n/a</strong> if not applicable.
              </DialogContentText>
              <Typography variant="h6">Personal information</Typography>

              <div>
                <TextField
                  id="name"
                  label="Name"
                  margin="normal"
                  value={fullname}
                  onChange={(e) => {
                    setFullname(e.target.value);
                  }}
                  autoFocus
                  required
                  fullWidth
                />
                <Grid container spacing={2}>
                  <Grid item xs={4} sx={{ marginTop: "1rem" }}>
                    <LocalizationProvider dateAdapter={AdapterDayjs}>
                      <DatePicker
                        label="Birthdate *"
                        format="YYYY-MM-DD"
                        sx={{ width: "100%" }}
                        value={dayjs(updateBirthdate)}
                        onChange={(newValue) => {
                          setUpdateBirthdate(newValue);
                          const formatBdate = formatDate(newValue);
                          dayjs.extend(relativeTime);

                          var newDate = dayjs(formatBdate).fromNow(true);

                          let firstWord = newDate.split(" ")[0];
                          var age = parseFloat(firstWord);
                          setAge(age);
                        }}
                        renderInput={(params) => <TextField {...params} />}
                      />
                    </LocalizationProvider>
                  </Grid>
                  <Grid item xs={4}>
                    <TextField
                      id="age"
                      label="Age"
                      margin="normal"
                      type="number"
                      disabled
                      value={age}
                      onChange={(e) => {
                        setAge(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                  </Grid>

                  <Grid
                    item
                    xs={4}
                    sx={{
                      display: "flex",
                      justifyContent: "space-around",
                      alignItems: "center",
                    }}
                  >
                    <div
                      style={{
                        display: "flex",
                        justifyContent: "center",
                        flexDirection: "column",
                      }}
                    >
                      {"Gender:"}
                    </div>
                    <Grid
                      item
                      sx={{ display: "flex", flexDirection: "column" }}
                    >
                      <FormControlLabel
                        value="top"
                        control={
                          <Radio
                            color="default"
                            value="Male"
                            checked={gender === "Male"}
                            name="radio-buttons"
                            onChange={handleChangeGender}
                          />
                        }
                        label="Male"
                        labelPlacement="right"
                      />
                      <FormControlLabel
                        value="top"
                        control={
                          <Radio
                            color="default"
                            value="Female"
                            checked={gender === "Female"}
                            name="radio-buttons"
                            onChange={handleChangeGender}
                          />
                        }
                        label="Female"
                        labelPlacement="right"
                      />
                    </Grid>
                  </Grid>
                </Grid>

                <Grid container spacing={2}>
                  <Grid item xs={4}>
                    <TextField
                      id="contact"
                      label="Contact no."
                      margin="normal"
                      value={contact}
                      onChange={(e) => {
                        setContact(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                  </Grid>
                  <Grid
                    item
                    xs={4}
                    sx={{
                      display: "flex",
                      alignItems: "center",
                      justifyContent: "center",
                    }}
                  >
                    <TextField
                      required
                      InputProps={{
                        endAdornment: (
                          <InputAdornment
                            position="end"
                            sx={{ marginLeft: ".3rem" }}
                          >
                            cm
                          </InputAdornment>
                        ),
                      }}
                      id="standard-input-height"
                      margin="normal"
                      label="Height"
                      type="number"
                      value={height}
                      onChange={(e) => {
                        setHeight(e.target.value);
                      }}
                      defaultValue={"user"}
                      helperText="Please put valid height"
                    ></TextField>
                  </Grid>
                  <Grid
                    item
                    xs={4}
                    sx={{
                      display: "flex",
                      alignItems: "center",
                      justifyContent: "center",
                    }}
                  >
                    <TextField
                      required
                      InputProps={{
                        endAdornment: (
                          <InputAdornment
                            position="end"
                            sx={{ marginLeft: ".3rem" }}
                          >
                            kg
                          </InputAdornment>
                        ),
                      }}
                      id="standard-input-weight"
                      margin="normal"
                      label="Weight"
                      type="number"
                      helperText="Please put valid weight"
                      value={weight}
                      onChange={(e) => {
                        setWeight(e.target.value);
                      }}
                    ></TextField>
                  </Grid>
                </Grid>
                <TextField
                  id="address"
                  label="Address"
                  margin="normal"
                  fullWidth
                  multiline
                  rows={2}
                  value={address}
                  sx={{ marginBottom: "1rem" }}
                  onChange={(e) => {
                    setAddress(e.target.value);
                  }}
                />
                <Divider />
                {membershipType == "admin" ? (
                  <Typography></Typography>
                ) : (
                  <Container style={{ padding: 0 }}>
                    <Typography sx={{ marginTop: "1rem" }} variant="h6">
                      Medical information
                    </Typography>
                    <TextField
                      id="medical_conditions"
                      label="Medical conditions"
                      margin="normal"
                      fullWidth
                      multiline
                      rows={2}
                      value={medicalConditions}
                      onChange={(e) => {
                        setMedicalConditions(e.target.value);
                      }}
                    />
                    <TextField
                      id="allergies"
                      label="Allergies"
                      margin="normal"
                      fullWidth
                      multiline
                      value={allergies}
                      rows={2}
                      onChange={(e) => {
                        setAllergies(e.target.value);
                      }}
                    />
                    <TextField
                      id="current_medications"
                      label="Current medications"
                      margin="normal"
                      fullWidth
                      multiline
                      rows={2}
                      value={currentMedication}
                      onChange={(e) => {
                        setCurrentMedication(e.target.value);
                      }}
                    />
                    <TextField
                      id="doctor_name"
                      label="Doctor's name"
                      margin="normal"
                      value={familyDoctor}
                      onChange={(e) => {
                        setFamilyDoctor(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                    <TextField
                      sx={{ marginBottom: "1rem" }}
                      id="doctor_contact"
                      label="Contact no."
                      margin="normal"
                      value={doctorContact}
                      onChange={(e) => {
                        setDoctorContact(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                    <Divider />
                    <Typography sx={{ marginTop: "1rem" }} variant="h6">
                      In case of emergency
                    </Typography>
                    <TextField
                      id="parent_name"
                      label="Parent's name"
                      margin="normal"
                      value={parentName}
                      onChange={(e) => {
                        setParentName(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                    <TextField
                      id="parent_contact"
                      label="Contact no."
                      margin="normal"
                      value={parentContact}
                      onChange={(e) => {
                        setParentContact(e.target.value);
                      }}
                      required
                      fullWidth
                    />
                    <TextField
                      id="parent_address"
                      label="Address"
                      margin="normal"
                      fullWidth
                      multiline
                      rows={2}
                      value={parentAddress}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setParentAddress(e.target.value);
                      }}
                    />
                    <Divider />
                  </Container>
                )}

                <Typography sx={{ marginTop: "1rem" }} variant="h6">
                  Membership
                </Typography>
                <Grid container spacing={2}>
                  <Grid item xs={6}>
                    <TextField
                      fullWidth
                      id="standard-select-membership"
                      select
                      margin="normal"
                      label="Membership"
                      value={membershipType}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        handlePriceMembership(e.target.value);
                        setMembershipType(e.target.value);
                      }}
                      helperText="Please select membership"
                    >
                      {membership.map((option) => (
                        <MenuItem key={option.id} value={option.name}>
                          {option.name}
                        </MenuItem>
                      ))}
                    </TextField>
                  </Grid>
                  <Grid item xs={6}>
                    <TextField
                      fullWidth
                      id="standard-select-membership"
                      inputProps={{
                        readOnly: "true",
                      }}
                      margin="normal"
                      label="Price"
                      value={membershipPrice}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setMembershipPrice(e.target.value);
                      }}
                    ></TextField>
                  </Grid>
                </Grid>
                <Grid container spacing={2}>
                  <Grid item xs={6}>
                    <LocalizationProvider dateAdapter={AdapterDayjs}>
                      <DatePicker
                        label="Start date"
                        format="YYYY-MM-DD"
                        sx={{ width: "100%" }}
                        value={dayjs(updateStartDate)}
                        onChange={(newValue) => {
                          setUpdateStartDate(newValue);
                          if (
                            membershipType === "Monthly" ||
                            membershipType === "Premium"
                          ) {
                            const startDd = newValue;
                            const updatedDate = dayjs(startDd).add(1, "month");
                            setUpdateEndDate(updatedDate);
                          }
                        }}
                        renderInput={(params) => <TextField {...params} />}
                      />
                    </LocalizationProvider>
                  </Grid>
                  <Grid item xs={6}>
                    <LocalizationProvider dateAdapter={AdapterDayjs}>
                      <DatePicker
                        label="End date *"
                        format="YYYY-MM-DD"
                        sx={{ width: "100%" }}
                        value={dayjs(updateEndDate)}
                        onChange={(newValue) => {
                          setUpdateEndDate(newValue);
                        }}
                        renderInput={(params) => <TextField {...params} />}
                      />
                    </LocalizationProvider>
                  </Grid>
                </Grid>
              </div>
            </DialogContent>
            <DialogActions>
              <Button
                variant="contained"
                color="error"
                onClick={() => handleCloseUpdateModal()}
              >
                CANCEL
              </Button>
              <LoadingButton
                variant="contained"
                onClick={updateUser}
                loading={isBtnLoading}
              >
                <span>UPDATE</span>
              </LoadingButton>
            </DialogActions>
          </Dialog>

          {/* MEAL PLANNING */}
          <Dialog
            fullScreen={modalWidth}
            open={openModalMealPlanning}
            aria-labelledby="responsive-dialog-title"
          >
            {hasMealPlan ? (
              <form onSubmit={updateMealPlan}>
                <DialogTitle id="responsive-dialog-title">
                  UPDATE MEAL PLANNING FOR: <b>{mealPlanUser}</b>
                </DialogTitle>
                <DialogContent>
                  <DialogContentText>
                    Fill up all fields, type <strong>n/a</strong> if not
                    applicable.
                  </DialogContentText>
                  <Divider />
                  <Grid container spacing={2}>
                    <Grid item xs={6}>
                      <TextField
                        required
                        id="standard-select-diet"
                        select
                        fullWidth
                        name="diet_type"
                        margin="normal"
                        value={typeDiet}
                        label="Diet type"
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          handleOnchangeUpdateDiet(e.target.value);
                          setTypeDiet(e.target.value);
                        }}
                        helperText="Select recommended diet type"
                      >
                        {recommendedMeals.map((diet) => (
                          <MenuItem key={diet.id} value={diet.diet_type}>
                            {diet.diet_type}
                          </MenuItem>
                        ))}
                      </TextField>
                    </Grid>
                    <Grid item xs={4}>
                      <TextField
                        inputProps={{ readOnly: true }}
                        sx={{
                          my: "1rem",
                          input: {
                            color: classsificationColor,
                            fontWeight: "bold",
                          },
                        }}
                        fullWidth
                        name="bmi"
                        id="standard-basic"
                        label="Classification"
                        value={bmiMessage}
                        onChange={(e) => {
                          setBmiMessage(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={2}>
                      <TextField
                        inputProps={{ readOnly: true }}
                        id="outlined-uncontrolled"
                        sx={{ my: "1rem" }}
                        fullWidth
                        name="bmi"
                        label="BMI"
                        value={bmiValue}
                        onChange={(e) => {
                          setBmiValue(e.target.value);
                        }}
                      />
                    </Grid>
                  </Grid>
                  <TextField
                    name="total_calories"
                    label="Total calories"
                    margin="normal"
                    fullWidth
                    value={totalCalories}
                    onChange={(e) => {
                      setTotalCalories(e.target.value);
                    }}
                  />

                  <Divider />
                  <Typography variant="h6">SUNDAY</Typography>

                  <div>
                    <TextField
                      name="sunday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={sundayBreakfast}
                      onChange={(e) => {
                        setSundayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="sunday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={sundayLunch}
                      onChange={(e) => {
                        setSundayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="sunday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      value={sundayDinner}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setSundayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">MONDAY</Typography>
                  <div>
                    <TextField
                      name="monday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      value={mondayBreakfast}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setMondayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="monday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      value={mondayLunch}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setMondayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="monday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      value={mondayDinner}
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setMondayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">TUESDAY</Typography>
                  <div>
                    <TextField
                      name="tuesday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={tuesdayBreakfast}
                      onChange={(e) => {
                        setTuesdayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="tuesday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={tuesdayLunch}
                      onChange={(e) => {
                        setTuesdayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="tuesday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={tuesdayDinner}
                      onChange={(e) => {
                        setTuesdayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">WEDNESDAY</Typography>
                  <div>
                    <TextField
                      name="wednesday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={wednesdayBreakfast}
                      onChange={(e) => {
                        setWednesdayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="wednesday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={wednesdayLunch}
                      onChange={(e) => {
                        setWednesdayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="wednesday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={wednesdayDinner}
                      onChange={(e) => {
                        setWednesdayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">THURSDAY</Typography>
                  <div>
                    <TextField
                      name="thursday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={thursdayBreakfast}
                      onChange={(e) => {
                        setThursdayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="thursday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={thursdayLunch}
                      onChange={(e) => {
                        setThursdayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="thursday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={thursdayDinner}
                      onChange={(e) => {
                        setThursdayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">FRIDAY</Typography>
                  <div>
                    <TextField
                      name="friday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={fridayBreakfast}
                      onChange={(e) => {
                        setFridayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="friday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={fridayLunch}
                      onChange={(e) => {
                        setFridayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="friday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={fridayDinner}
                      onChange={(e) => {
                        setFridayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">SATURDAY</Typography>
                  <div>
                    <TextField
                      name="saturday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={saturdayBreakfast}
                      onChange={(e) => {
                        setSaturdayBreakfast(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="saturday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={saturdayLunch}
                      onChange={(e) => {
                        setSaturdayLunch(e.target.value);
                      }}
                      required
                    />
                    <TextField
                      name="saturday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      value={saturdayDinner}
                      onChange={(e) => {
                        setSaturdayDinner(e.target.value);
                      }}
                      required
                    />
                  </div>
                </DialogContent>
                <DialogActions>
                  <Button
                    variant="contained"
                    color="error"
                    onClick={() => {
                      handleCloseModalMealPlanning();
                    }}
                  >
                    CANCEL
                  </Button>
                  <LoadingButton
                    variant="contained"
                    loading={isBtnLoading}
                    type="submit"
                  >
                    <span>UPDATE</span>
                  </LoadingButton>
                </DialogActions>
              </form>
            ) : (
              <form onSubmit={createMealPlan}>
                <DialogTitle id="responsive-dialog-title">
                  CREATE MEAL PLANNING FOR: <b>{mealPlanUser}</b>
                </DialogTitle>
                <DialogContent>
                  <DialogContentText>
                    Fill up all fields, type <strong>n/a</strong> if not
                    applicable.
                  </DialogContentText>
                  <Divider />
                  <Grid container spacing={2}>
                    <Grid item xs={6}>
                      <TextField
                        required
                        id="standard-select-diet"
                        select
                        fullWidth
                        name="diet_type"
                        margin="normal"
                        value={typeDiet}
                        label="Diet type"
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          handleOnchangeDiet(e.target.value);
                          setTypeDiet(e.target.value);
                        }}
                        helperText="Select recommended diet type"
                      >
                        {recommendedMeals.map((diet) => (
                          <MenuItem key={diet.id} value={diet.diet_type}>
                            {diet.diet_type}
                          </MenuItem>
                        ))}
                      </TextField>
                    </Grid>
                    <Grid item xs={4}>
                      <TextField
                        required
                        inputProps={{ readOnly: true }}
                        sx={{
                          my: "1rem",
                          input: {
                            color: classsificationColor,
                            fontWeight: "bold",
                          },
                        }}
                        fullWidth
                        name="bmi"
                        id="standard-basic"
                        label="Classification"
                        value={bmiMessage}
                        onChange={(e) => {
                          setBmiMessage(e.target.value);
                        }}
                      />
                    </Grid>
                    <Grid item xs={2}>
                      <TextField
                        required
                        inputProps={{ readOnly: true }}
                        id="outlined-uncontrolled"
                        sx={{ my: "1rem" }}
                        fullWidth
                        name="bmi"
                        label="BMI"
                        value={bmiValue}
                        onChange={(e) => {
                          setBmiValue(e.target.value);
                        }}
                      />
                    </Grid>
                  </Grid>
                  <TextField
                    required
                    name="total_calories"
                    label="Total calories"
                    margin="normal"
                    fullWidth
                    onChange={(e) => {
                      setTotalCalories(e.target.value);
                    }}
                  />
                  <Divider />
                  <Typography variant="h6">SUNDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="sunday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={sundayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="sunday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={sundayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="sunday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={sundayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">MONDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="monday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={mondayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="monday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={mondayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="monday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={mondayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">TUESDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="tuesday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={tuesdayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="tuesday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={tuesdayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="tuesday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={tuesdayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">WEDNESDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="wednesday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={wednesdayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="wednesday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={wednesdayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="wednesday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={wednesdayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">THURSDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="thursday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={thursdayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="thursday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={thursdayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="thursday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={thursdayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">FRIDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="friday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={fridayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="friday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={fridayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="friday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={fridayReadyDinner}
                    />
                  </div>

                  <Divider />
                  <Typography variant="h6">SATURDAY</Typography>
                  <div>
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="saturday_breakfast"
                      label="Breakfast"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={saturdayReadyBreakfast}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="saturday_lunch"
                      label="Lunch"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={saturdayReadyLunch}
                    />
                    <TextField
                      inputProps={{ readOnly: true }}
                      name="saturday_dinner"
                      label="Dinner"
                      margin="dense"
                      fullWidth
                      multiline
                      rows={2}
                      sx={{ marginBottom: "1rem" }}
                      required
                      value={saturdayReadyDinner}
                    />
                  </div>
                </DialogContent>
                <DialogActions>
                  <Button
                    variant="contained"
                    color="error"
                    onClick={() => {
                      handleCloseModalMealPlanning();
                    }}
                  >
                    CANCEL
                  </Button>
                  <LoadingButton
                    variant="contained"
                    loading={isBtnLoading}
                    type="submit"
                  >
                    <span>CREATE</span>
                  </LoadingButton>
                </DialogActions>
              </form>
            )}
          </Dialog>

          {/* UPDATE PASSWORD */}

          <Dialog
            fullScreen={modalWidth}
            open={openModalUpdatePassword}
            aria-labelledby="responsive-dialog-title"
          >
            <form onSubmit={updatePassword}>
              <DialogTitle id="responsive-dialog-title">
                UPDATE PASSWORD
              </DialogTitle>
              <DialogContent>
                <DialogContentText>
                  Update password for: <strong>{selectedUser}</strong>
                </DialogContentText>
                <Divider />
                <Typography>Old password: {selectedUserPassword}</Typography>
                <div>
                  <TextField
                    name="newPassword"
                    label="Type new password here"
                    margin="dense"
                    fullWidth
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      e.preventDefault();
                      if (e.target.value.length <= 5) {
                        setPasswordButton(true);
                      } else {
                        setPasswordButton(false);
                      }
                    }}
                    required
                  />
                  <span>Password must be at least 6 or more characters</span>
                </div>
              </DialogContent>
              <DialogActions>
                <Button
                  variant="contained"
                  color="error"
                  onClick={() => {
                    setOpenModalUpdatePassword(false);
                  }}
                >
                  CANCEL
                </Button>
                <LoadingButton
                  variant="contained"
                  disabled={passwordButton}
                  loading={isBtnLoading}
                  type="submit"
                >
                  <span>UPDATE</span>
                </LoadingButton>
              </DialogActions>
            </form>
          </Dialog>

          <Paper sx={{ width: "100%", overflow: "hidden" }} elevation={3}>
            <TableContainer sx={{ maxHeight: 700 }}>
              <Table stickyHeader aria-label="sticky table">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>USERNAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ROLE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      SUBSCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ADDED BY</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ACTIVE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ACTIONS
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DATE ADDED
                    </TableCell>
                  </TableRow>
                </TableHead>
                {tableHasNoData ? (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={10}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                ) : (
                  <TableBody>
                    {filteredList
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((user) => {
                        const pesoFormat = new Intl.NumberFormat("fil-PH", {
                          style: "currency",
                          currency: "PHP",
                        }).format(user.price);
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={user.id}
                          >
                            <TableCell>{user.username}</TableCell>
                            <TableCell>{user.role}</TableCell>
                            <TableCell>{user.name}</TableCell>
                            <TableCell>{pesoFormat}</TableCell>
                            <TableCell>{user.added_by}</TableCell>
                            <TableCell>
                              <Switch
                                onChange={(e) => {
                                  changeUserStatus(
                                    e.target.checked,
                                    user.username
                                  );
                                }}
                                defaultChecked={user.isActive ? true : false}
                              />
                            </TableCell>
                            <TableCell align="center">
                              <Button
                                onClick={() =>
                                  handleClickOpenModalUpdate(user.username)
                                }
                                variant="text"
                                color="success"
                                sx={{ marginRight: ".5rem" }}
                              >
                                Update
                              </Button>
                              {user.role === "admin" ? (
                                <Button
                                  variant="text"
                                  disabled
                                  color="warning"
                                  onClick={() =>
                                    handleOpenModalMealPlanning(user.username)
                                  }
                                >
                                  Meal plan
                                </Button>
                              ) : (
                                <Button
                                  variant="text"
                                  color="warning"
                                  onClick={() =>
                                    handleOpenModalMealPlanning(user.username)
                                  }
                                >
                                  Meal plan
                                </Button>
                              )}
                              <Button
                                variant="text"
                                color="success"
                                sx={{ marginRight: ".5rem" }}
                                onClick={() =>
                                  handleOpenModalUpdatePassword(
                                    user.username,
                                    user.password
                                  )
                                }
                              >
                                Update Password
                              </Button>
                              <IconButton
                                aria-label="cart"
                                onClick={() => deleteUser(user.username)}
                              >
                                <DeleteForeverIcon color="error" />
                              </IconButton>
                            </TableCell>
                            <TableCell>{formatDate(user.date_added)}</TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                )}
              </Table>
            </TableContainer>
            <div
              style={{ position: "absolute", width: "5rem", height: "10rem" }}
            >
              <Typography
                sx={{
                  py: "1rem",
                  width: "50rem",
                  mx: "1rem",
                  fontWeight: "bold",
                }}
              >
                GRAND TOTAL : {pesoFormat}
              </Typography>
            </div>
            <TablePagination
              rowsPerPageOptions={[10, 50, 100]}
              component="div"
              count={filteredList.length}
              rowsPerPage={rowsPerPage}
              page={page}
              onPageChange={handleChangePage}
              onRowsPerPageChange={handleChangeRowsPerPage}
            />

            {/* PDF */}
            <TableContainer sx={{ maxHeight: 700, display: "none" }}>
              <Table stickyHeader aria-label="sticky table" id="userTable">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>USERNAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ROLE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>NAME</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      SUBSCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ADDED BY</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ACTIVE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DATE ADDED
                    </TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {filteredList
                    .slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
                    .map((user) => {
                      const pesoFormat = new Intl.NumberFormat("fil-PH", {
                        style: "currency",
                        currency: "PHP",
                      }).format(user.price);
                      return (
                        <StyledTableRow
                          hover
                          // role="checkbox"
                          tabIndex={-1}
                          key={user.id}
                        >
                          <TableCell>{user.username}</TableCell>
                          <TableCell>{user.role}</TableCell>
                          <TableCell>{user.name}</TableCell>
                          <TableCell>{user.price}</TableCell>
                          <TableCell>{user.added_by}</TableCell>
                          <TableCell>{user.isActive}</TableCell>
                          <TableCell>{formatDate(user.date_added)}</TableCell>
                        </StyledTableRow>
                      );
                    })}
                </TableBody>
              </Table>
            </TableContainer>
          </Paper>
        </div>
      )}
    </>
  );
}

export default User;
