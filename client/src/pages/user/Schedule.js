import { useEffect, useState } from "react";
import {
  CircularProgress,
  Backdrop,
  Paper,
  TableContainer,
  Table,
  TableHead,
  TableRow,
  TableCell,
  TableBody,
  TablePagination,
  Chip,
  Button,
  Dialog,
  DialogTitle,
  DialogContent,
  DialogContentText,
  DialogActions,
  Stack,
  Grid,
  TextField,
  MenuItem,
} from "@mui/material";
import { useTheme, styled } from "@mui/material/styles";
import LoadingButton from "@mui/lab/LoadingButton/LoadingButton";
import useMediaQuery from "@mui/material/useMediaQuery";
import Swal from "sweetalert2";

import { AdapterDayjs } from "@mui/x-date-pickers/AdapterDayjs";
import { LocalizationProvider } from "@mui/x-date-pickers/LocalizationProvider";
import { DatePicker } from "@mui/x-date-pickers/DatePicker";
import dayjs from "dayjs";
import {
  cleanDigitSectionValue,
  cleanLeadingZeros,
} from "@mui/x-date-pickers/internals/hooks/useField/useField.utils";
import { esES } from "@mui/x-date-pickers";

function Reservation() {
  const [isLoading, setIsLoading] = useState(true);
  const [reservationData, setReservationData] = useState([]);
  const [getThisDate, setGetThisDate] = useState(dayjs(new Date()));
  const [thisMonth, setThisMonth] = useState("");
  const [selectedMonth, setSelectedMonth] = useState("");
  const [timeNow, setTimeNow] = useState(0);

  // data table
  const [page, setPage] = useState(0);
  const [rowsPerPage, setRowsPerPage] = useState(10);
  const [tableHasNoData, setTableHasNoData] = useState(true);

  // Dialog
  const theme = useTheme();
  const modalWidth = useMediaQuery(theme.breakpoints.down("md"));
  const [openCreateModal, setOpenCreateModal] = useState(false);
  const [isBtnLoading, setIsBtnLoading] = useState(false);

  const [filterByDate, setFilterByDate] = useState(dayjs(new Date()));
  const [selectStatus, setSelectStatus] = useState("");
  const status = [
    {
      name: "All",
      value: "All",
      color: "",
    },
    {
      name: "Pending",
      value: "Pending",
      color: "#ed6c02",
    },
    {
      name: "Confirmed",
      value: "Confirmed",
      color: "#2e7d32",
    },
    {
      name: "Cancelled",
      value: "Cancelled",
      color: "#d32f2f",
    },
    {
      name: "Declined",
      value: "Declined",
      color: "#9c27b0",
    },
    {
      name: "Completed",
      value: "Completed",
      color: "#1976d2",
    },
  ];

  // CREATE NEW RESERVATION
  const [reservationDate, setReservationDate] = useState(filterByDate);
  const [reservationNotes, setReservationNotes] = useState("");
  const [selectedTimeSlot, setSelectedTimeSlot] = useState("");
  const [coachName, setCoachName] = useState("");

  const [firstBatchIsDisabled, setFirstBatchIsDisabled] = useState(true);
  const [secondBatchIsDisabled, setSecondBatchIsDisabled] = useState(true);
  const [thirdBatchIsDisabled, setThirdBatchIsDisabled] = useState(true);
  const [fourthBatchIsDisabled, setFourthBatchIsDisabled] = useState(true);
  const [fifthBatchIsDisabled, setFifthBatchIsDisabled] = useState(true);
  const [lastBatchIsDisabled, setLastBatchIsDisabled] = useState(true);

  const timeSlot = [
    {
      name: "7-9AM",
      value: "7-9AM",
      disabled: firstBatchIsDisabled,
    },
    {
      name: "9-11AM",
      value: "9-11AM",
      disabled: secondBatchIsDisabled,
    },
    {
      name: "1-3PM",
      value: "1-3PM",
      disabled: thirdBatchIsDisabled,
    },
    {
      name: "3-5PM",
      value: "3-5PM",
      disabled: fourthBatchIsDisabled,
    },
    {
      name: "5-7PM",
      value: "5-7PM",
      disabled: fifthBatchIsDisabled,
    },
    {
      name: "7-9PM",
      value: "7-9PM",
      disabled: lastBatchIsDisabled,
    },
  ];
  const handleChangePage = (event, newPage) => {
    setPage(newPage);
  };

  const handleChangeRowsPerPage = (event) => {
    setRowsPerPage(+event.target.value);
    setPage(0);
  };

  const time = new Date().toLocaleTimeString();
  let setDate = new Date();
  let newDate = setDate.toGMTString();

  const handleOpenModalCreateReservation = () => {
    handleTime();
    setOpenCreateModal(true);
    getReservationByDate(reservationDate);
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

  useEffect(() => {
    handleTime();
    const timer = setTimeout(() => {
      var formattedDate = formatDate(new Date());
      fetch(
        "https://gymerls-staging-server.vercel.app/api/get-reservation-by-username-and-date",
        {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            username: localStorage.getItem("username"),
            reservation_date: formattedDate,
          }),
        }
      )
        .then((response) => response.json())
        .then((data) => {
          setReservationData(data);
          if (data.length === 0) {
            setTableHasNoData(true);
          } else {
            setTableHasNoData(false);
          }
        });

      setIsLoading(false);
    }, 1000);
    return () => clearTimeout(timer);
  }, []);

  const formatDate = (date) => {
    var dateToFormat = new Date(date);
    var year = dateToFormat.toLocaleString("default", { year: "numeric" });
    var month = dateToFormat.toLocaleString("default", { month: "2-digit" });
    var day = dateToFormat.toLocaleString("default", { day: "2-digit" });

    var formattedDate = year + "-" + month + "-" + day;
    return formattedDate;
  };

  const closeReservationModalCreate = () => {
    setCoachName("");
    setSelectedTimeSlot("");
    setReservationNotes("");
    setOpenCreateModal(false);
  };

  const filteredDataByDate = (date) => {
    setFilterByDate(date);
    setPage(0);
    setSelectStatus("All");
    var formattedDate = formatDate(date);

    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-reservation-by-username-and-date",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: localStorage.getItem("username"),
          reservation_date: formattedDate,
        }),
      }
    )
      .then((res) => res.json())
      .then((data) => {
        if (data.length === 0) {
          setTableHasNoData(true);
        } else {
          setTableHasNoData(false);
          setReservationData(data);
        }
      });
  };

  const filteredDataByStatusAndDate = (status) => {
    setPage(0);
    setSelectStatus(status);

    if (status === "All") {
      window.location.reload(false);
    } else {
      fetch(
        "https://gymerls-staging-server.vercel.app/api/get-reservation-by-username-date-status",
        {
          method: "POST",
          headers: {
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            username: localStorage.getItem("username"),
            reservation_date:
              filterByDate === null
                ? formatDate(new Date())
                : formatDate(filterByDate),
            status: status,
          }),
        }
      )
        .then((res) => res.json())
        .then((data) => {
          if (data.length === 0) {
            setTableHasNoData(true);
          } else {
            setTableHasNoData(false);
            setReservationData(data);
          }
        });
    }
  };

  const selectedDate = getThisDate.toString();

  const handleTime = () => {
    handleMonths();
    var currentDate = new Date();
    var hours = currentDate.getHours();
    var minutes = currentDate.getMinutes();
    const timeNows = hours + (minutes < 10 ? "0" : "") + minutes;

    let validTime = "";
    if (timeNows >= 700 && timeNows < 900) {
      validTime = 1;
    } else if (timeNows >= 901 && timeNows < 1100) {
      validTime = 2;
    } else if (timeNows >= 1101 && timeNows < 1300) {
      validTime = 3;
    } else if (timeNows >= 1301 && timeNows < 1500) {
      validTime = 3;
    } else if (timeNows >= 1501 && timeNows < 1700) {
      validTime = 4;
    } else if (timeNows >= 1701 && timeNows < 1900) {
      validTime = 5;
    } else if (timeNows >= 1901 && timeNows < 2100) {
      validTime = 6;
    } else if (timeNows > 2101) {
      validTime = 7;
    }
    setTimeNow(validTime);
  };

  const handleMonths = () => {
    let currentMonth = "";
    let month = newDate.slice(8, 11);

    if (month === "Jan") {
      currentMonth = 1;
    } else if (month === "Feb") {
      currentMonth = 2;
    } else if (month === "Mar") {
      currentMonth = 3;
    } else if (month === "Apr") {
      currentMonth = 4;
    } else if (month === "May") {
      currentMonth = 5;
    } else if (month === "Jun") {
      currentMonth = 6;
    } else if (month === "Jul") {
      currentMonth = 7;
    } else if (month === "Aug") {
      currentMonth = 8;
    } else if (month === "Sep") {
      currentMonth = 9;
    } else if (month === "Oct") {
      currentMonth = 10;
    } else if (month === "Nov") {
      currentMonth = 11;
    } else if (month === "Dec") {
      currentMonth = 12;
    }
    let selectMonth = selectedDate.slice(8, 11);
    let selectDate = "";
    if (selectMonth === "Jan") {
      selectDate = 1;
    } else if (selectMonth === "Feb") {
      selectDate = 2;
    } else if (selectMonth === "Mar") {
      selectDate = 3;
    } else if (selectMonth === "Apr") {
      selectDate = 4;
    } else if (selectMonth === "May") {
      selectDate = 5;
    } else if (selectMonth === "Jun") {
      selectDate = 6;
    } else if (selectMonth === "Jul") {
      selectDate = 7;
    } else if (selectMonth === "Aug") {
      selectDate = 8;
    } else if (selectMonth === "Sep") {
      selectDate = 9;
    } else if (selectMonth === "Oct") {
      selectDate = 10;
    } else if (selectMonth === "Nov") {
      selectDate = 11;
    } else if (selectMonth === "Dec") {
      selectDate = 12;
    }
    setThisMonth(currentMonth);
    setSelectedMonth(selectDate);
  };

  const createReservation = (event) => {
    event.preventDefault();

    const data = new FormData(event.currentTarget);
    var currentDate = new Date();

    let monthNow = newDate.slice(0, 8) + thisMonth + newDate.slice(11, 16);
    let selectMonth =
      selectedDate.slice(0, 8) + selectedMonth + selectedDate.slice(11, 16);

    let selectedDay = selectMonth.slice(5, 7);
    let dayNow = monthNow.slice(5, 7);

    let selectValidTime = "";
    if (selectedTimeSlot === "7-9AM") {
      selectValidTime = 1;
    } else if (selectedTimeSlot === "9-11AM") {
      selectValidTime = 2;
    } else if (selectedTimeSlot === "1-3PM") {
      selectValidTime = 3;
    } else if (selectedTimeSlot === "3-5PM") {
      selectValidTime = 4;
    } else if (selectedTimeSlot === "5-7PM") {
      selectValidTime = 5;
    } else if (selectedTimeSlot === "7-9PM") {
      selectValidTime = 6;
    } else {
      selectValidTime = 7;
    }
    // YEAR VALIDAION
    if (selectMonth.slice(10, 16) >= monthNow.slice(10, 16)) {
      // MONTH VALIDATION
      if (selectedMonth == thisMonth) {
        // DAY VALIDATION
        if (selectedDay == dayNow) {
          // HOUR VALIDATION
          if (selectValidTime >= timeNow) {
            Swal.fire({
              icon: "info",
              title: "Are you sure you want to proceed?",
              text: "You won't be able to revert this!",
              showCancelButton: true,
              confirmButtonText: "Yes",
              cancelButtonText: "No",
              allowOutsideClick: false,
            }).then((result) => {
              if (result.isConfirmed) {
                fetch(
                  "https://gymerls-staging-server.vercel.app/api/create-reservation",
                  {
                    method: "POST",
                    headers: {
                      "Content-type": "application/json",
                    },
                    body: JSON.stringify({
                      username: localStorage.getItem("username"),
                      notes: data.get("reservation_notes"),
                      reservation_date: formatDate(getThisDate),
                      status: "Pending",
                      time_slot: data.get("time_slot"),
                      coach_name: data.get("coach_name"),
                      added_date: formatDate(new Date()),
                    }),
                  }
                )
                  .then((res) => res.json())
                  .then((result) => {});

                userLog(
                  localStorage.getItem("username"),
                  "Create",
                  "new reservation"
                );

                Swal.fire({
                  title: "Successfully created!",
                  icon: "success",
                  showConfirmButton: false,
                  timer: 1500,
                }).then(function () {
                  setIsBtnLoading(false);
                  setIsLoading(true);
                  window.location.reload(false);
                });
              } else {
                setIsBtnLoading(false);
              }
            });
          } else {
            Swal.fire({
              title: "Please select valid time",
              icon: "warning",
              showConfirmButton: true,
              confirmButtonText: "OK",
              allowOutsideClick: false,
            });
          }
        } else if (selectedDay > dayNow) {
          Swal.fire({
            icon: "info",
            title: "Are you sure you want to proceed?",
            text: "You won't be able to revert this!",
            showCancelButton: true,
            confirmButtonText: "Yes",
            cancelButtonText: "No",
            allowOutsideClick: false,
          }).then((result) => {
            if (result.isConfirmed) {
              fetch(
                "https://gymerls-staging-server.vercel.app/api/create-reservation",
                {
                  method: "POST",
                  headers: {
                    "Content-type": "application/json",
                  },
                  body: JSON.stringify({
                    username: localStorage.getItem("username"),
                    notes: data.get("reservation_notes"),
                    reservation_date: formatDate(reservationDate),
                    status: "Pending",
                    time_slot: data.get("time_slot"),
                    coach_name: data.get("coach_name"),
                    added_date: formatDate(new Date()),
                  }),
                }
              )
                .then((res) => res.json())
                .then((result) => {});

              userLog(
                localStorage.getItem("username"),
                "Create",
                "new reservation"
              );

              Swal.fire({
                title: "Successfully created!",
                icon: "success",
                showConfirmButton: false,
                timer: 1500,
              }).then(function () {
                setIsBtnLoading(false);
                setIsLoading(true);
                window.location.reload(false);
              });
            } else {
              setIsBtnLoading(false);
            }
          });
        } else {
          Swal.fire({
            title: "Please select valid date",
            icon: "warning",
            showConfirmButton: true,
            confirmButtonText: "OK",
            allowOutsideClick: false,
          });
        }
      } else if (selectedMonth > thisMonth) {
        Swal.fire({
          icon: "info",
          title: "Are you sure you want to proceed?",
          text: "You won't be able to revert this!",
          showCancelButton: true,
          confirmButtonText: "Yes",
          cancelButtonText: "No",
          allowOutsideClick: false,
        }).then((result) => {
          if (result.isConfirmed) {
            fetch(
              "https://gymerls-staging-server.vercel.app/api/create-reservation",
              {
                method: "POST",
                headers: {
                  "Content-type": "application/json",
                },
                body: JSON.stringify({
                  username: localStorage.getItem("username"),
                  notes: data.get("reservation_notes"),
                  reservation_date: formatDate(reservationDate),
                  status: "Pending",
                  time_slot: data.get("time_slot"),
                  coach_name: data.get("coach_name"),
                  added_date: formatDate(new Date()),
                }),
              }
            )
              .then((res) => res.json())
              .then((result) => {});

            userLog(
              localStorage.getItem("username"),
              "Create",
              "new reservation"
            );

            Swal.fire({
              title: "Successfully created!",
              icon: "success",
              showConfirmButton: false,
              timer: 1500,
            }).then(function () {
              setIsBtnLoading(false);
              setIsLoading(true);
              window.location.reload(false);
            });
          } else {
            setIsBtnLoading(false);
          }
        });
      } else {
        Swal.fire({
          title: "Please select valid date",
          icon: "warning",
          showConfirmButton: true,
          confirmButtonText: "OK",
          allowOutsideClick: false,
        });
      }
    } else {
      Swal.fire({
        title: "Please select valid date",
        icon: "warning",
        showConfirmButton: true,
        confirmButtonText: "OK",
        allowOutsideClick: false,
      });
    }
  };

  const getIpAddress = (callback) => {
    fetch("https://api.ipify.org?format=json")
      .then((response) => response.json())
      .then((data) => callback(data.ip))
      .catch((error) => console.log(error));
  };

  const userLog = (author, action, event) => {
    getIpAddress(function (callback) {
      fetch("https://gymerls-staging-server.vercel.app/api/insert-log", {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          username: author,
          event_info: `${action} - ${event}`,
          ip_address: callback,
          platform: window.navigator.userAgentData.platform,
        }),
      }).catch((error) => console.log(error));
    });
  };

  const getReservationByDate = (date) => {
    var formattedDate = formatDate(date);

    fetch(
      "https://gymerls-staging-server.vercel.app/api/get-reservation-by-date-and-status-is-confirmed",
      {
        method: "POST",
        headers: {
          "Content-type": "application/json",
        },
        body: JSON.stringify({
          reservation_date: formattedDate,
        }),
      }
    )
      .then((res) => res.json())
      .then((data) => {
        var first_batch = [];
        var second_batch = [];
        var third_batch = [];
        var fourth_batch = [];
        var fifth_batch = [];
        var last_batch = [];

        for (let item of data) {
          if (item.time_slot === "7-9AM") {
            first_batch.push(item);
          } else if (item.time_slot === "9-11AM") {
            second_batch.push(item);
          } else if (item.time_slot === "1-3PM") {
            third_batch.push(item);
          } else if (item.time_slot === "3-5PM") {
            fourth_batch.push(item);
          } else if (item.time_slot === "5-7PM") {
            fifth_batch.push(item);
          } else {
            last_batch.push(item);
          }
        }

        first_batch.length === 3
          ? setFirstBatchIsDisabled(true)
          : setFirstBatchIsDisabled(false);

        second_batch.length === 3
          ? setSecondBatchIsDisabled(true)
          : setSecondBatchIsDisabled(false);

        third_batch.length === 3
          ? setThirdBatchIsDisabled(true)
          : setThirdBatchIsDisabled(false);

        fourth_batch.length === 3
          ? setFourthBatchIsDisabled(true)
          : setFourthBatchIsDisabled(false);

        fifth_batch.length === 3
          ? setFifthBatchIsDisabled(true)
          : setFifthBatchIsDisabled(false);

        last_batch.length === 3
          ? setLastBatchIsDisabled(true)
          : setLastBatchIsDisabled(false);
      });
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
          {/* CREATE RESERVATION */}
          <Dialog
            fullScreen={modalWidth}
            open={openCreateModal}
            aria-labelledby="responsive-dialog-title"
          >
            <form onSubmit={createReservation}>
              <DialogTitle id="responsive-dialog-title">
                CREATE NEW RESERVATION
              </DialogTitle>
              <DialogContent>
                <DialogContentText>Fill up all fields</DialogContentText>
                <div>
                  <LocalizationProvider dateAdapter={AdapterDayjs}>
                    <DatePicker
                      defaultValue={dayjs(new Date())}
                      label="Reservation date"
                      name="reservation_date"
                      margin="normal"
                      format="YYYY-MM-DD"
                      sx={{ width: "100%", marginTop: 1 }}
                      value={reservationDate}
                      onChange={(newValue) => {
                        handleMonths();
                        setGetThisDate(newValue);
                        setReservationDate(newValue);
                        getReservationByDate(newValue);
                        setSelectedTimeSlot("");
                      }}
                      required
                      renderInput={(params) => <TextField {...params} />}
                    />
                  </LocalizationProvider>
                  <TextField
                    id="notes"
                    name="reservation_notes"
                    label="Note"
                    margin="dense"
                    fullWidth
                    value={reservationNotes}
                    multiline
                    rows={2}
                    onChange={(e) => {
                      setReservationNotes(e.target.value);
                    }}
                    required
                  />
                  <TextField
                    id="standard-select-slot"
                    select
                    fullWidth
                    margin="dense"
                    name="time_slot"
                    label="Time slot"
                    value={selectedTimeSlot}
                    onChange={(e) => {
                      handleMonths();
                      setSelectedTimeSlot(e.target.value);
                    }}
                    defaultValue={"7-9AM"}
                    helperText="Please select time slot"
                    required
                  >
                    <MenuItem disabled={firstBatchIsDisabled} value={"7-9AM"}>
                      {"7-9AM"}
                    </MenuItem>
                    <MenuItem disabled={secondBatchIsDisabled} value={"9-11AM"}>
                      {"9-11AM"}
                    </MenuItem>
                    <MenuItem disabled={thirdBatchIsDisabled} value={"1-3PM"}>
                      {"1-3PM"}
                    </MenuItem>
                    <MenuItem disabled={fourthBatchIsDisabled} value={"3-5PM"}>
                      {"3-5PM"}
                    </MenuItem>
                    <MenuItem disabled={fifthBatchIsDisabled} value={"5-7PM"}>
                      {"5-7PM"}
                    </MenuItem>
                    <MenuItem disabled={lastBatchIsDisabled} value={"7-9PM"}>
                      {"7-9PM"}
                    </MenuItem>
                  </TextField>
                  <TextField
                    id="coachName"
                    label="Coach"
                    margin="dense"
                    name="coach_name"
                    value={coachName}
                    onChange={(e) => {
                      setCoachName(e.target.value);
                    }}
                    autoFocus
                    required
                    fullWidth
                  />
                </div>
              </DialogContent>
              <DialogActions>
                <Button
                  variant="contained"
                  color="error"
                  onClick={() => closeReservationModalCreate()}
                >
                  CANCEL
                </Button>
                <LoadingButton
                  type="submit"
                  variant="contained"
                  loading={isBtnLoading}
                >
                  <span>CREATE</span>
                </LoadingButton>
              </DialogActions>
            </form>
          </Dialog>

          <Stack>
            <Grid
              container
              sx={{
                display: "flex",
                alignItems: "center",
              }}
            >
              <Grid item xs={6}>
                <Grid>
                  <Button
                    variant="outlined"
                    onClick={() => handleOpenModalCreateReservation()}
                  >
                    New schedule
                  </Button>
                </Grid>
              </Grid>
              <Grid
                item
                xs={6}
                sx={{
                  display: "flex",
                  alignItems: "center",
                  columnGap: 2,
                }}
              >
                <Grid item xs={6}>
                  <TextField
                    id="standard-select-status"
                    select
                    fullWidth
                    margin="normal"
                    label="Status"
                    value={selectStatus}
                    sx={{ marginBottom: "1rem" }}
                    onChange={(e) => {
                      filteredDataByStatusAndDate(e.target.value);
                    }}
                    defaultValue={"All"}
                  >
                    {status.map((option) => (
                      <MenuItem
                        key={option.name}
                        value={option.value}
                        sx={{ color: option.color }}
                      >
                        {option.value}
                      </MenuItem>
                    ))}
                  </TextField>
                </Grid>
                <Grid item xs={6}>
                  <LocalizationProvider dateAdapter={AdapterDayjs}>
                    <DatePicker
                      label="Date"
                      format="YYYY-MM-DD"
                      sx={{ width: "100%" }}
                      value={filterByDate}
                      onChange={(newValue) => {
                        filteredDataByDate(newValue.$d);
                      }}
                      renderInput={(params) => <TextField {...params} />}
                    />
                  </LocalizationProvider>
                </Grid>
              </Grid>
            </Grid>
          </Stack>
          <Paper
            sx={{ width: "100%", overflow: "hidden", marginTop: "2rem" }}
            elevation={3}
          >
            <TableContainer sx={{ maxHeight: 700 }}>
              <Table stickyHeader aria-label="sticky table">
                <TableHead>
                  <TableRow>
                    <TableCell sx={{ fontWeight: "bold" }}>NOTES</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>
                      RESERVATION DATE
                    </TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>STATUS</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>TIME SLOT</TableCell>
                    <TableCell sx={{ fontWeight: "bold" }}>COACH</TableCell>
                  </TableRow>
                </TableHead>
                {tableHasNoData ? (
                  <TableBody>
                    <StyledTableRow>
                      <TableCell align="center" colSpan={5}>
                        {"No data available"}
                      </TableCell>
                    </StyledTableRow>
                  </TableBody>
                ) : (
                  <TableBody>
                    {reservationData
                      .slice(
                        page * rowsPerPage,
                        page * rowsPerPage + rowsPerPage
                      )
                      .map((res) => {
                        return (
                          <StyledTableRow
                            hover
                            // role="checkbox"
                            tabIndex={-1}
                            key={res.id}
                          >
                            <TableCell>{res.notes}</TableCell>
                            <TableCell>
                              {formatDate(res.reservation_date)}
                            </TableCell>
                            {/* <TableCell>{res.status}</TableCell> */}
                            <TableCell>
                              {res.status === "Pending" ? (
                                <Chip
                                  label="Pending"
                                  color="warning"
                                  sx={{ width: "6rem" }}
                                />
                              ) : res.status === "Confirmed" ? (
                                <Chip
                                  label="Confirmed"
                                  color="success"
                                  sx={{ width: "6rem" }}
                                />
                              ) : res.status === "Cancelled" ? (
                                <Chip
                                  label="Cancelled"
                                  color="error"
                                  sx={{ width: "6rem" }}
                                />
                              ) : res.status === "Declined" ? (
                                <Chip
                                  label="Declined"
                                  color="secondary"
                                  sx={{ width: "6rem" }}
                                />
                              ) : (
                                <Chip
                                  label="Completed"
                                  color="primary"
                                  sx={{ width: "6rem" }}
                                />
                              )}
                            </TableCell>
                            <TableCell>{res.time_slot}</TableCell>
                            <TableCell>{res.coach_name}</TableCell>
                          </StyledTableRow>
                        );
                      })}
                  </TableBody>
                )}
              </Table>
            </TableContainer>
            <TablePagination
              rowsPerPageOptions={[10, 15, 20]}
              component="div"
              count={reservationData.length}
              rowsPerPage={rowsPerPage}
              page={page}
              onPageChange={handleChangePage}
              onRowsPerPageChange={handleChangeRowsPerPage}
            />
          </Paper>
        </div>
      )}
    </>
  );
}

export default Reservation;
