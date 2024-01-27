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
} from "@mui/material";
import useMediaQuery from "@mui/material/useMediaQuery";
import { useTheme, styled } from "@mui/material/styles";
import LoadingButton from "@mui/lab/LoadingButton";
import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import dayjs from "dayjs";
import Swal from "sweetalert2";
import jsPDF from "jspdf";
import autoTable from "jspdf-autotable";
import PrintIcon from "@mui/icons-material/Print";
import Box from "@mui/material/Box";
import InputLabel from "@mui/material/InputLabel";
import FormControl from "@mui/material/FormControl";
import Select from "@mui/material/Select";
import { cleanDigitSectionValue } from "@mui/x-date-pickers/internals/hooks/useField/useField.utils";

function MealplantAuto() {
  const relativeTime = require("dayjs/plugin/relativeTime");
  const [open, setOpen] = useState(false);
  const [openModalUpdate, setOpenModalUpdate] = useState(false);

  const theme = useTheme();
  const fullScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const modalWidth = useMediaQuery(theme.breakpoints.down("md"));
  const [isLoading, setIsLoading] = useState(true);
  const [isBtnLoading, setIsBtnLoading] = useState(false);
  const [dietTypeIsValid, setDietTypeIsValid] = useState(false);
  const [isVisible, setIsVisible] = useState(true);

  const [hasMealPlan, setHasMealPlan] = useState(true);

  const [bmiClass, setBmiClass] = useState("");

  // READY MEAL DATA
  const [newDietType, setNewDietType] = useState("");

  const [filteredClass, setFilteredClass] = useState("ALL");
  const [updateMealOpen, setUpdateMealOpen] = useState(false);
  const [createReadyMealButtonIsDisabled, setCreateReadyMealButtonIsDisabled] =
    useState(false);

  const [updateMealModal, setUpdateMealModal] = useState(false);
  const [readyMealid, setReadyMealId] = useState(0);
  const [updateButtonIsDisable, setUpdateButtonIsDisable] = useState(false);

  const [readyMeals, setReadyMeals] = useState([]);

  const [dietType, setDietType] = useState();

  const [descriptions, setDescriptions] = useState("");

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

  // data table
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [tableHasNoData, setTableHasNoData] = useState(false);
  const [mealsHasnoData, setMealsHasnoData] = useState(false);

  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };
  const mealPlanLog = (author, action, event, type) => {
    getIpAddress(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/insert-log", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: author,
          event_info: `${action} - ${event} "${type}"`,
          ip_address: callback,
          platform: window.navigator.userAgentData.platform,
        }),
      }).catch((error) => console.log(error));
    });
  };
  const classsifications = [
    {
      name: "Severe Thinnes",
      value: "Severe Thinnes",
    },
    {
      name: "Moderate Thinnes",
      value: "Moderate Thinnes",
    },
    {
      name: "Mild Thinnes",
      value: "Mild Thinnes",
    },
    {
      name: "Normal",
      value: "Normal",
    },
    {
      name: "Overweight",
      value: "Overweight",
    },
    {
      name: "Obese Class I",
      value: "Obese Class I",
    },
    {
      name: "Obese Class II",
      value: "Obese Class II",
    },
    {
      name: "Obese Class III",
      value: "Obese Class III",
    },
  ];

  //CREATE READY MEAL
  const handleReadyMealLogs = (dietyarn) => {
    mealPlanLog(
      localStorage.getItem("username"),
      "Created",
      "new ready meal",
      dietyarn
    );
  };

  const createReadyMeals = (event) => {
    event.preventDefault();
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        handleReadyMealLogs(dietType);
        handleCreateReadyMeal();
      }
    });
  };

  const handleCreateReadyMeal = () => {
    fetch("https://gymerls-staging-server.vercel.app/api/create-ready-meals", {
      method: "POST",
      headers: {
        "Content-type": "application/json",
      },
      body: JSON.stringify({
        bmi: bmiClass,
        diet_type: dietType,
        descriptions: descriptions,
        status: 1,
        ready_sunday_breakfast: sundayReadyBreakfast,
        ready_sunday_lunch: sundayReadyLunch,
        ready_sunday_dinner: sundayReadyDinner,
        ready_monday_breakfast: mondayReadyBreakfast,
        ready_monday_lunch: mondayReadyLunch,
        ready_monday_dinner: mondayReadyDinner,
        ready_tuesday_breakfast: tuesdayReadyBreakfast,
        ready_tuesday_lunch: tuesdayReadyLunch,
        ready_tuesday_dinner: tuesdayReadyDinner,
        ready_wednesday_breakfast: wednesdayReadyBreakfast,
        ready_wednesday_lunch: wednesdayReadyLunch,
        ready_wednesday_dinner: wednesdayReadyDinner,
        ready_thursday_breakfast: thursdayReadyBreakfast,
        ready_thursday_lunch: thursdayReadyLunch,
        ready_thursday_dinner: thursdayReadyDinner,
        ready_friday_breakfast: fridayReadyBreakfast,
        ready_friday_lunch: fridayReadyLunch,
        ready_friday_dinner: fridayReadyDinner,
        ready_saturday_breakfast: saturdayReadyBreakfast,
        ready_saturday_lunch: saturdayReadyLunch,
        ready_saturday_dinner: saturdayReadyDinner,
        added_by: localStorage.getItem("username"),
      }),
    })
      .then((res) => res.json())
      .then((result) => {
        setOpen(false);
        handleCloseModalReadyMealPlanning();
        window.location.reload(false);
      });
  };

  //DELETE READY MEAL
  const deleteReadyMeal = (id, diet_type) => {
    Swal.fire({
      icon: "warning",
      title: "Are you sure you want to delete this ready meal?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        mealPlanLog(
          localStorage.getItem("username"),
          "Delete",
          "ready meal",
          diet_type
        );

        // DELETE IN READY MEAL
        fetch(
          "https://gymerls-staging-server.vercel.app/api/delete-ready-meal",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              id: id,
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

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const handleClickOpen = () => {
    setOpen(true);
  };

  const handleClose = () => {
    setOpen(false);
    handleCloseModalReadyMealPlanning();
    setIsLoading(false);
  };

  const handleCloseUpdateMeals = () => {
    setOpenModalUpdate(false);
    setIsLoading(false);
    handleCloseModalReadyMealPlanning();
  };

  const validateDietType = (dietType) => {
    setDietTypeIsValid(true);
    setCreateReadyMealButtonIsDisabled(true);
    setIsVisible(true);

    if (dietType.length >= 5) {
      fetch(
        "https://gymerls-staging-server.vercel.app/api/validate-diet-type",
        {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            diet_type: dietType,
          }),
        }
      )
        .then((res) => res.json())
        .then((result) => {
          if (result.length === 0) {
            setDietTypeIsValid(true);
            setCreateReadyMealButtonIsDisabled(false);
            setIsVisible(false);
          } else {
            setDietTypeIsValid(false);
            setCreateReadyMealButtonIsDisabled(true);
            setIsVisible(false);
          }
        });
    }
  };

  const validateUpdateDietType = (diettype) => {
    setDietTypeIsValid(true);
    setIsVisible(true);
    if (diettype.length >= 5) {
      fetch(
        "https://gymerls-staging-server.vercel.app/api/validate-diet-type",
        {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            diet_type: diettype,
          }),
        }
      )
        .then((res) => res.json())
        .then((result) => {
          if (result.length == 0) {
            setDietTypeIsValid(true);
            setCreateReadyMealButtonIsDisabled(false);
            setIsVisible(false);
          } else {
            if (dietType == diettype) {
              setDietTypeIsValid(true);
              setCreateReadyMealButtonIsDisabled(false);
              setIsVisible(false);
            } else {
              setDietTypeIsValid(false);
              setCreateReadyMealButtonIsDisabled(true);
              setIsVisible(false);
            }
          }
        });
    } else {
      setDietTypeIsValid(false);
      setCreateReadyMealButtonIsDisabled(true);
      setIsVisible(false);
    }
  };

  useEffect(() => {
    getReadyMealsDataToPopulateTable();
    const timer = setTimeout(() => {
      fetch("https://gymerls-staging-server.vercel.app/api/get-user-by-role", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          added_by: localStorage.getItem("username"),
        }),
      })
        .then((response) => response.json())
        .then((data) => {
          if (data === 0) {
            setTableHasNoData(false);
          } else {
            setIsLoading(false);
            setTableHasNoData(true);
          }
        });
    }, 1000);
    return () => clearTimeout(timer);
  }, []);

  //get all data to populate table
  const getReadyMealsDataToPopulateTable = () => {
    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-ready-meal-by-username",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          added_by: localStorage.getItem("username"),
        }),
      }
    )
      .then((response) => response.json())
      .then((data) => {
        if (data.length !== 0) {
          setReadyMeals(data);
          setFilteredReadyMeals(data);
          setMealsHasnoData(true);
        } else {
          setMealsHasnoData(false);
        }
      });
  };

  const [filteredReadyMeals, setFilteredReadyMeals] = new useState(readyMeals);
  const filterBySearch = (e) => {
    const results = readyMeals.filter((readymeal) => {
      if (e.target.value === "") return readymeal;
      return readymeal.diet_type
        .toLowerCase()
        .includes(e.target.value.toLowerCase());
    });
    setFilteredReadyMeals(results);
  };
  const filterByClass = (e) => {
    const results = readyMeals.filter((meals) => {
      if (e.target.value === "All") return meals;
      return meals.bmi.toLowerCase().includes(e.target.value.toLowerCase());
    });
    if (results.length !== 0) {
      setFilteredReadyMeals(results);
      setMealsHasnoData(true);
    } else {
      setMealsHasnoData(false);
      setFilteredReadyMeals(results);
    }
  };

  const getReadyMealsData = (id) => {
    handleClickOpenModalUpdateMeal();
    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-ready-meals-by-id",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          id: id,
        }),
      }
    )
      .then((res) => res.json())
      .then((result) => {
        setReadyMealId(id);
        for (let meal of result) {
          setBmiClass(meal.bmi);
          setDietType(meal.diet_type);
          setNewDietType(meal.diet_type);
          setDescriptions(meal.descriptions);
          setSundayReadyBreakfast(meal.ready_sunday_breakfast);
          setSundayReadyLunch(meal.ready_sunday_lunch);
          setSundayReadyDinner(meal.ready_sunday_dinner);
          setMondayReadyBreakfast(meal.ready_monday_breakfast);
          setMondayReadyLunch(meal.ready_monday_lunch);
          setMondayReadyDinner(meal.ready_monday_dinner);
          setTuesdayReadyBreakfast(meal.ready_tuesday_breakfast);
          setTuesdayReadyLunch(meal.ready_tuesday_lunch);
          setTuesdayReadyDinner(meal.ready_tuesday_dinner);
          setWednesdayReadyBreakfast(meal.ready_wednesday_breakfast);
          setWednesdayReadyLunch(meal.ready_wednesday_lunch);
          setWednesdayReadyDinner(meal.ready_wednesday_dinner);
          setThursdayReadyBreakfast(meal.ready_thursday_breakfast);
          setThursdayReadyLunch(meal.ready_thursday_lunch);
          setThursdayReadyDinner(meal.ready_thursday_dinner);
          setFridayReadyBreakfast(meal.ready_friday_breakfast);
          setFridayReadyLunch(meal.ready_friday_lunch);
          setFridayReadyDinner(meal.ready_friday_dinner);
          setSaturdayReadyBreakfast(meal.ready_saturday_breakfast);
          setSaturdayReadyLunch(meal.ready_saturday_lunch);
          setSaturdayReadyDinner(meal.ready_saturday_dinner);
        }
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

  const handleClickOpenModalUpdateMeal = () => {
    setUpdateMealOpen(true);
    setUpdateMealModal(true);
    setOpenModalUpdate(true);
  };

  const updateReadyMeal = (event) => {
    setIsBtnLoading(true);
    event.preventDefault();
    const data = new FormData(event.currentTarget);
    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update this meal?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(
          "https://gymerls-staging-server.vercel.app/api/update-ready-meal",
          {
            method: "PATCH",
            headers: {
              "Content-type": "application/json",
            },
            body: JSON.stringify({
              bmi: data.get("bmi"),
              diet_type: data.get("diet_type"),
              descriptions: data.get("description"),
              ready_sunday_breakfast: data.get("sunday_breakfast"),
              ready_sunday_lunch: data.get("sunday_lunch"),
              ready_sunday_dinner: data.get("sunday_dinner"),
              ready_monday_breakfast: data.get("monday_breakfast"),
              ready_monday_lunch: data.get("monday_lunch"),
              ready_monday_dinner: data.get("monday_dinner"),
              ready_tuesday_breakfast: data.get("tuesday_breakfast"),
              ready_tuesday_lunch: data.get("tuesday_lunch"),
              ready_tuesday_dinner: data.get("tuesday_dinner"),
              ready_wednesday_breakfast: data.get("wednesday_breakfast"),
              ready_wednesday_lunch: data.get("wednesday_lunch"),
              ready_wednesday_dinner: data.get("wednesday_dinner"),
              ready_thursday_breakfast: data.get("thursday_breakfast"),
              ready_thursday_lunch: data.get("thursday_lunch"),
              ready_thursday_dinner: data.get("thursday_dinner"),
              ready_friday_breakfast: data.get("friday_breakfast"),
              ready_friday_lunch: data.get("friday_lunch"),
              ready_friday_dinner: data.get("friday_dinner"),
              ready_saturday_breakfast: data.get("saturday_breakfast"),
              ready_saturday_lunch: data.get("saturday_lunch"),
              ready_saturday_dinner: data.get("saturday_dinner"),
              added_by: localStorage.getItem("username"),
              id: readyMealid,
            }),
          }
        )
          .then((res) => res.json())
          .then((result) => {
            mealPlanLog(
              localStorage.getItem("username"),
              "Update",
              "ready meal",
              dietType
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

  const handleCloseModalReadyMealPlanning = () => {
    setBmiClass("");
    setDietType("");
    setDescriptions("");
    setSundayReadyBreakfast("");
    setSundayReadyLunch("");
    setSundayReadyDinner("");
    setMondayReadyBreakfast("");
    setMondayReadyLunch("");
    setMondayReadyDinner("");
    setTuesdayReadyBreakfast("");
    setTuesdayReadyLunch("");
    setTuesdayReadyDinner("");
    setWednesdayReadyBreakfast("");
    setWednesdayReadyLunch("");
    setWednesdayReadyDinner("");
    setThursdayReadyBreakfast("");
    setThursdayReadyLunch("");
    setThursdayReadyDinner("");
    setFridayReadyBreakfast("");
    setFridayReadyLunch("");
    setFridayReadyDinner("");
    setSaturdayReadyBreakfast("");
    setSaturdayReadyLunch("");
    setSaturdayReadyDinner("");
    setIsVisible(true);
    setCreateReadyMealButtonIsDisabled(true);
  };

  const changeReadyMealStatus = (status, diet_type) => {
    Swal.fire({
      icon: "info",
      title: "Are you sure you want to update the status to this ready meal?",
      text: "You won't be able to revert this!",
      showCancelButton: true,
      confirmButtonText: "Yes",
      cancelButtonText: "No",
      allowOutsideClick: false,
    }).then((result) => {
      if (result.isConfirmed) {
        setIsBtnLoading(true);
        handleReadyMealStatus(status, diet_type);
      } else {
        window.location.reload(false);
      }
    });
  };

  const handleReadyMealStatus = (status, diet_type) => {
    fetch(
      "https://gymerls-staging-server.vercel.app/api/update-ready-meal-status",
      {
        method: "PATCH",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          status: status ? 1 : 0,
          diet_type: diet_type,
        }),
      }
    )
      .then((res) => res.json())
      .then((data) => {
        if (status == 1) {
          mealPlanLog(
            localStorage.getItem("username"),
            "Change",
            "status to enable of ",
            diet_type
          );
        }
        {
          mealPlanLog(
            localStorage.getItem("username"),
            "Change",
            "status to disable of ",
            diet_type
          );
        }

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

  const getIpAddress = (callback) => {
    fetch("https://api.ipify.org?format=json")
      .then((response) => response.json())
      .then((data) => callback(data.ip))
      .catch((error) => console.log(error));
  };

  const downloadPdf = () => {
    const doc = new jsPDF();
    doc.text("List of Readymeals", 20, 10);
    doc.autoTable({ html: "#usersTable" });
    doc.save("readymeals.pdf");
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
          <Grid container spacing={1}>
            <Grid item xs={12} md={6}>
              <Button variant="outlined" onClick={handleClickOpen}>
                Create new Ready Meal
              </Button>
            </Grid>
            <Grid item xs={4} md={2}>
              <TextField
                select
                name="searchClassification"
                label="Search diet"
                onChange={filterByClass}
                fullWidth
                defaultValue={"All"}
              >
                <MenuItem value={"All"}>{"All"}</MenuItem>
                <MenuItem sx={{ color: "#bc2020" }} value={"<" + 16}>
                  <Typography sx={{ color: "#bc2020" }}>
                    {"Severe Thinnes"}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#d38888" }} value={16 + " to " + 17}>
                  <Typography sx={{ color: "#d38888" }}>
                    {"Moderate Thinnes"}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#ffe400" }} value={17 + " to " + 18.5}>
                  <Typography sx={{ color: "#ffe400" }}>
                    {"Mild Thinnes "}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#008137" }} value={18.5 + " to " + 25}>
                  <Typography sx={{ color: "#008137" }}>{"Normal"}</Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#ffe400" }} value={25 + " to " + 30}>
                  <Typography sx={{ color: "#ffe400" }}>
                    {"Overweight"}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#d38888" }} value={30 + " to " + 35}>
                  <Typography sx={{ color: "#d38888" }}>
                    {"Obese Class I"}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#bc2020" }} value={35 + " to " + 40}>
                  <Typography sx={{ color: "#bc2020" }}>
                    {"Obese Class II"}
                  </Typography>
                </MenuItem>
                <MenuItem sx={{ color: "#8a0101" }} value={">" + 40}>
                  <Typography sx={{ color: "#8a0101" }}>
                    {"Obese Class III"}
                  </Typography>
                </MenuItem>
              </TextField>
            </Grid>
            <Grid item xs={6} md={4}>
              <TextField
                label="Search diet"
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

          {/* CREATE NEW READY MEALS */}
          <Dialog
            fullScreen={fullScreen}
            open={open}
            aria-labelledby="responsive-dialog-title"
          >
            <DialogContent>
              {hasMealPlan ? (
                <form onSubmit={createReadyMeals}>
                  <DialogTitle id="responsive-dialog-title">
                    CREATE READY MEALS
                  </DialogTitle>
                  <DialogContent>
                    <DialogContentText>
                      Fill up all fields, type <strong>n/a</strong> if not
                      applicable.
                    </DialogContentText>
                    <Divider />

                    <TextField
                      id="standard_type_diet"
                      name="diet_type"
                      label="Diet type"
                      fullWidth
                      multiline
                      sx={{ marginBottom: ".5rem" }}
                      required
                      value={dietType}
                      onChange={(e) => {
                        validateDietType(e.target.value);
                        setDietType(e.target.value);
                      }}
                      helperText="Diet type must be 5 characters and above "
                    />
                    <DialogContentText sx={{ marginBottom: ".5rem" }}>
                      {dietTypeIsValid ? (
                        <Typography
                          variant="caption"
                          margin="normal"
                          hidden={isVisible}
                          sx={{
                            fontSize: "0.8rem",
                            color: "green",
                          }}
                        >
                          Diet type is available
                        </Typography>
                      ) : (
                        <Typography
                          variant="caption"
                          margin="normal"
                          hidden={isVisible}
                          sx={{
                            fontSize: "0.8rem",
                            color: "#ae1919",
                          }}
                        >
                          Diet type is taken
                        </Typography>
                      )}
                    </DialogContentText>
                    <TextField
                      id="description"
                      name="description"
                      label="Descriptions"
                      fullWidth
                      multiline
                      value={descriptions}
                      onChange={(e) => {
                        setDescriptions(e.target.value);
                      }}
                      sx={{ marginBottom: "1rem" }}
                      required
                    />
                    <TextField
                      defaultValue={"Normal 18.5 to 25"}
                      required
                      id="standard-class-bmi"
                      select
                      fullWidth
                      name="bmi"
                      margin="normal"
                      value={bmiClass}
                      label="Classifications BMI"
                      sx={{ marginBottom: "1rem" }}
                      onChange={(e) => {
                        setBmiClass(e.target.value);
                      }}
                    >
                      <MenuItem sx={{ color: "#bc2020" }} value={"<" + 16}>
                        <Typography sx={{ color: "#bc2020" }}>
                          {"Severe Thinnes <16"}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#d38888" }}
                        value={16 + " to " + 17}
                      >
                        <Typography sx={{ color: "#d38888" }}>
                          {"Moderate Thinnes 16 to 17"}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#ffe400" }}
                        value={17 + " to " + 18.5}
                      >
                        <Typography sx={{ color: "#ffe400" }}>
                          {"Mild Thinnes 17 to 18.5 "}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#008137" }}
                        value={18.5 + " to " + 25}
                      >
                        <Typography sx={{ color: "#008137" }}>
                          {"Normal 18.5 to 25"}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#ffe400" }}
                        value={25 + " to " + 30}
                      >
                        <Typography sx={{ color: "#ffe400" }}>
                          {"Overweight 25 to 30"}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#d38888" }}
                        value={30 + " to " + 35}
                      >
                        <Typography sx={{ color: "#d38888" }}>
                          {"Obese Class I 30 to 35"}
                        </Typography>
                      </MenuItem>
                      <MenuItem
                        sx={{ color: "#bc2020" }}
                        value={35 + " to " + 40}
                      >
                        <Typography sx={{ color: "#bc2020" }}>
                          {"Obese Class II 35 to 40"}
                        </Typography>
                      </MenuItem>
                      <MenuItem sx={{ color: "#8a0101" }} value={">" + 40}>
                        <Typography sx={{ color: "#8a0101" }}>
                          {"Obese Class III >40"}
                        </Typography>
                      </MenuItem>
                    </TextField>

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
                        value={sundayReadyBreakfast}
                        onChange={(e) => {
                          setSundayReadyBreakfast(e.target.value);
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
                        value={sundayReadyLunch}
                        onChange={(e) => {
                          setSundayReadyLunch(e.target.value);
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
                        value={sundayReadyDinner}
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          setSundayReadyDinner(e.target.value);
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
                        value={mondayReadyBreakfast}
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          setMondayReadyBreakfast(e.target.value);
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
                        value={mondayReadyLunch}
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          setMondayReadyLunch(e.target.value);
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
                        value={mondayReadyDinner}
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          setMondayReadyDinner(e.target.value);
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
                        value={tuesdayReadyBreakfast}
                        onChange={(e) => {
                          setTuesdayReadyBreakfast(e.target.value);
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
                        value={tuesdayReadyLunch}
                        onChange={(e) => {
                          setTuesdayReadyLunch(e.target.value);
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
                        value={tuesdayReadyDinner}
                        onChange={(e) => {
                          setTuesdayReadyDinner(e.target.value);
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
                        value={wednesdayReadyBreakfast}
                        onChange={(e) => {
                          setWednesdayReadyBreakfast(e.target.value);
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
                        value={wednesdayReadyLunch}
                        onChange={(e) => {
                          setWednesdayReadyLunch(e.target.value);
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
                        value={wednesdayReadyDinner}
                        onChange={(e) => {
                          setWednesdayReadyDinner(e.target.value);
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
                        value={thursdayReadyBreakfast}
                        onChange={(e) => {
                          setThursdayReadyBreakfast(e.target.value);
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
                        value={thursdayReadyLunch}
                        onChange={(e) => {
                          setThursdayReadyLunch(e.target.value);
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
                        value={thursdayReadyDinner}
                        onChange={(e) => {
                          setThursdayReadyDinner(e.target.value);
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
                        value={fridayReadyBreakfast}
                        onChange={(e) => {
                          setFridayReadyBreakfast(e.target.value);
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
                        value={fridayReadyLunch}
                        onChange={(e) => {
                          setFridayReadyLunch(e.target.value);
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
                        value={fridayReadyDinner}
                        onChange={(e) => {
                          setFridayReadyDinner(e.target.value);
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
                        value={saturdayReadyBreakfast}
                        onChange={(e) => {
                          setSaturdayReadyBreakfast(e.target.value);
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
                        value={saturdayReadyLunch}
                        onChange={(e) => {
                          setSaturdayReadyLunch(e.target.value);
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
                        value={saturdayReadyDinner}
                        onChange={(e) => {
                          setSaturdayReadyDinner(e.target.value);
                        }}
                        required
                      />
                    </div>

                    <DialogActions sx={{ pt: "1.5rem", pb: "0rem" }}>
                      <Button
                        variant="contained"
                        color="error"
                        onClick={handleClose}
                      >
                        CANCEL
                      </Button>
                      <LoadingButton
                        variant="contained"
                        disabled={createReadyMealButtonIsDisabled}
                        loading={isBtnLoading}
                        type="submit"
                      >
                        <span>CREATE</span>
                      </LoadingButton>
                    </DialogActions>
                  </DialogContent>
                </form>
              ) : (
                <form></form>
              )}
            </DialogContent>
          </Dialog>
          {/* MEAL PLANNING */}

          <Paper sx={{ width: "100%", overflow: "hidden" }} elevation={3}>
            <TableContainer sx={{ maxHeight: 700 }}>
              <Table stickyHeader aria-label="sticky table">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>DIET</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>BMI range</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      CLASSIFICATION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>ACTIVE</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ACTIONS
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ADDED-BY
                    </TableCell>
                  </TableRow>
                </TableHead>
                {mealsHasnoData ? (
                  <TableBody>
                    {filteredReadyMeals
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((meals) => {
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={meals.id}
                          >
                            <TableCell>{meals.diet_type}</TableCell>
                            <TableCell>{meals.bmi}</TableCell>
                            <TableCell>
                              {meals.bmi == "<16" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#bc2020" }}
                                >
                                  Severe Thinnes
                                </Typography>
                              ) : meals.bmi == "16 to 17" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#d38888" }}
                                >
                                  Moderate Thinnes
                                </Typography>
                              ) : meals.bmi == "17 to 18.5" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#ffe400" }}
                                >
                                  Mild Thinnes
                                </Typography>
                              ) : meals.bmi == "18.5 to 25" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#008137" }}
                                >
                                  Normal
                                </Typography>
                              ) : meals.bmi == "25 to 30" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#ffe400" }}
                                >
                                  Overweight
                                </Typography>
                              ) : meals.bmi == "30 to 35" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#d38888" }}
                                >
                                  Obese Class I
                                </Typography>
                              ) : meals.bmi == "35 to 40" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#bc2020" }}
                                >
                                  Obese Class II
                                </Typography>
                              ) : meals.bmi == ">40" ? (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "#8a0101" }}
                                >
                                  Obese Class III
                                </Typography>
                              ) : (
                                <Typography
                                  sx={{ fontWeight: "bold", color: "black" }}
                                >
                                  No data
                                </Typography>
                              )}
                            </TableCell>
                            <TableCell>{meals.descriptions}</TableCell>
                            <TableCell>
                              <Switch
                                onChange={(e) => {
                                  changeReadyMealStatus(
                                    e.target.checked,
                                    meals.diet_type
                                  );
                                }}
                                defaultChecked={meals.status ? true : false}
                              />
                            </TableCell>
                            <TableCell align="center">
                              <Button
                                onClick={() => {
                                  getReadyMealsData(meals.id);
                                }}
                                variant="text"
                                color="success"
                                sx={{ marginRight: ".5rem" }}
                              >
                                Update
                              </Button>
                              <Button
                                variant="text"
                                color="warning"
                                onClick={() => {
                                  deleteReadyMeal(meals.id, meals.diet_type);
                                }}
                              >
                                Delete
                              </Button>
                            </TableCell>
                            <TableCell align="center">
                              {meals.added_by}
                            </TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                ) : (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={7}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                )}
              </Table>
            </TableContainer>
            <TablePagination
              rowsPerPageOptions={[10, 15, 20]}
              component="div"
              count={filteredReadyMeals.length}
              rowsPerPage={rowsPerPage}
              page={page}
              onPageChange={handleChangePage}
              onRowsPerPageChange={handleChangeRowsPerPage}
            />

            <Dialog
              // key={meal.id}
              fullScreen={fullScreen}
              open={openModalUpdate}
              aria-labelledby="responsive-dialog-title"
            >
              <DialogContent>
                {updateMealModal ? (
                  <form onSubmit={updateReadyMeal}>
                    <DialogTitle id="responsive-dialog-title">
                      UPDATE MEALS
                    </DialogTitle>
                    <DialogContent>
                      <DialogContentText>
                        Fill up all fields, type <strong>n/a</strong> if not
                        applicable.
                      </DialogContentText>
                      <Divider />
                      <TextField
                        id="standard_type_diet"
                        name="diet_type"
                        label="Diet type"
                        fullWidth
                        multiline
                        sx={{ marginBottom: "1rem" }}
                        required
                        value={dietType}
                        onChange={(e) => {
                          validateUpdateDietType(e.target.value);
                          setNewDietType(e.target.value);
                        }}
                        helperText="Please fill up diet type"
                      />
                      <DialogContentText sx={{ marginBottom: ".5rem" }}>
                        {dietTypeIsValid ? (
                          <Typography
                            variant="caption"
                            margin="normal"
                            hidden={isVisible}
                            sx={{
                              fontSize: "0.8rem",
                              color: "green",
                            }}
                          >
                            Diet type is available
                          </Typography>
                        ) : (
                          <Typography
                            variant="caption"
                            margin="normal"
                            hidden={isVisible}
                            sx={{
                              fontSize: "0.8rem",
                              color: "#ae1919",
                            }}
                          >
                            Diet type is taken
                          </Typography>
                        )}
                      </DialogContentText>
                      <TextField
                        id="description"
                        name="description"
                        label="Descriptions"
                        fullWidth
                        multiline
                        value={descriptions}
                        onChange={(e) => {
                          setDescriptions(e.target.value);
                        }}
                        sx={{ marginBottom: "1rem" }}
                        required
                      />
                      <TextField
                        id="standard-class-bmi"
                        select
                        fullWidth
                        name="bmi"
                        margin="normal"
                        value={bmiClass}
                        label="Classifications BMI"
                        sx={{ marginBottom: "1rem" }}
                        onChange={(e) => {
                          setBmiClass(e.target.value);
                        }}
                      >
                        <MenuItem sx={{ color: "#bc2020" }} value={"<" + 16}>
                          <Typography sx={{ color: "#bc2020" }}>
                            {"Severe Thinnes <16"}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#d38888" }}
                          value={16 + " to " + 17}
                        >
                          <Typography sx={{ color: "#d38888" }}>
                            {"Moderate Thinnes 16 to 17"}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#ffe400" }}
                          value={17 + " to " + 18.5}
                        >
                          <Typography sx={{ color: "#ffe400" }}>
                            {"Mild Thinnes 17 to 18.5 "}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#008137" }}
                          value={18.5 + " to " + 25}
                        >
                          <Typography sx={{ color: "#008137" }}>
                            {"Normal 18.5 to 25"}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#ffe400" }}
                          value={25 + " to " + 30}
                        >
                          <Typography sx={{ color: "#ffe400" }}>
                            {"Overweight 25 to 30"}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#d38888" }}
                          value={30 + " to " + 35}
                        >
                          <Typography sx={{ color: "#d38888" }}>
                            {"Obese Class I 30 to 35"}
                          </Typography>
                        </MenuItem>
                        <MenuItem
                          sx={{ color: "#bc2020" }}
                          value={35 + " to " + 40}
                        >
                          <Typography sx={{ color: "#bc2020" }}>
                            {"Obese Class II 35 to 40"}
                          </Typography>
                        </MenuItem>
                        <MenuItem sx={{ color: "#8a0101" }} value={">" + 40}>
                          <Typography sx={{ color: "#8a0101" }}>
                            {"Obese Class III >40"}
                          </Typography>
                        </MenuItem>
                      </TextField>

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
                          value={sundayReadyBreakfast}
                          onChange={(e) => {
                            setSundayReadyBreakfast(e.target.value);
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
                          value={sundayReadyLunch}
                          onChange={(e) => {
                            setSundayReadyLunch(e.target.value);
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
                          value={sundayReadyDinner}
                          sx={{ marginBottom: "1rem" }}
                          onChange={(e) => {
                            setSundayReadyDinner(e.target.value);
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
                          value={mondayReadyBreakfast}
                          sx={{ marginBottom: "1rem" }}
                          onChange={(e) => {
                            setMondayReadyBreakfast(e.target.value);
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
                          value={mondayReadyLunch}
                          sx={{ marginBottom: "1rem" }}
                          onChange={(e) => {
                            setMondayReadyLunch(e.target.value);
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
                          value={mondayReadyDinner}
                          sx={{ marginBottom: "1rem" }}
                          onChange={(e) => {
                            setMondayReadyDinner(e.target.value);
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
                          value={tuesdayReadyBreakfast}
                          onChange={(e) => {
                            setTuesdayReadyBreakfast(e.target.value);
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
                          value={tuesdayReadyLunch}
                          onChange={(e) => {
                            setTuesdayReadyLunch(e.target.value);
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
                          value={tuesdayReadyDinner}
                          onChange={(e) => {
                            setTuesdayReadyDinner(e.target.value);
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
                          value={wednesdayReadyBreakfast}
                          onChange={(e) => {
                            setWednesdayReadyBreakfast(e.target.value);
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
                          value={wednesdayReadyLunch}
                          onChange={(e) => {
                            setWednesdayReadyLunch(e.target.value);
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
                          value={wednesdayReadyDinner}
                          onChange={(e) => {
                            setWednesdayReadyDinner(e.target.value);
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
                          value={thursdayReadyBreakfast}
                          onChange={(e) => {
                            setThursdayReadyBreakfast(e.target.value);
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
                          value={thursdayReadyLunch}
                          onChange={(e) => {
                            setThursdayReadyLunch(e.target.value);
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
                          value={thursdayReadyDinner}
                          onChange={(e) => {
                            setThursdayReadyDinner(e.target.value);
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
                          value={fridayReadyBreakfast}
                          onChange={(e) => {
                            setFridayReadyBreakfast(e.target.value);
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
                          value={fridayReadyLunch}
                          onChange={(e) => {
                            setFridayReadyLunch(e.target.value);
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
                          value={fridayReadyDinner}
                          onChange={(e) => {
                            setFridayReadyDinner(e.target.value);
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
                          value={saturdayReadyBreakfast}
                          onChange={(e) => {
                            setSaturdayReadyBreakfast(e.target.value);
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
                          value={saturdayReadyLunch}
                          onChange={(e) => {
                            setSaturdayReadyLunch(e.target.value);
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
                          value={saturdayReadyDinner}
                          onChange={(e) => {
                            setSaturdayReadyDinner(e.target.value);
                          }}
                          required
                        />
                      </div>
                      <DialogActions sx={{ pt: "1.5rem", pb: "0rem" }}>
                        <Button
                          variant="contained"
                          color="error"
                          onClick={handleCloseUpdateMeals}
                        >
                          CANCEL
                        </Button>
                        <LoadingButton
                          // onClick={updateReadyMeal}
                          variant="contained"
                          // loading={isBtnLoading}
                          disabled={createReadyMealButtonIsDisabled}
                          type="submit"
                        >
                          <span>UPDATE</span>
                        </LoadingButton>
                      </DialogActions>
                    </DialogContent>
                  </form>
                ) : (
                  <form></form>
                )}
              </DialogContent>
            </Dialog>

            {/* PDF */}
            <TableContainer sx={{ maxHeight: 700, display: "none" }}>
              <Table stickyHeader aria-label="sticky table" id="usersTable">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>DIET</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>BMI</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      DESCRIPTION
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }} align="center">
                      ADDED-BY
                    </TableCell>
                  </TableRow>
                </TableHead>
                {mealsHasnoData ? (
                  <TableBody>
                    {filteredReadyMeals
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((meals) => {
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={meals.id}
                          >
                            <TableCell>{meals.diet_type}</TableCell>
                            <TableCell>{meals.bmi}</TableCell>
                            <TableCell>{meals.descriptions}</TableCell>
                            <TableCell>{meals.added_by}</TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                ) : (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={3}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                )}
              </Table>
            </TableContainer>
          </Paper>
        </div>
      )}
    </>
  );
}

export default MealplantAuto;
