#= 
    This code was generated by heta-compiler of v0.5.8
    
=#

module julia 
using SimSolver

### create default constants
constants_ = NamedTuple{(
  
)}(Float64[
  
])

### initialization of ODE variables and Records
function start_(cons)
    #() = cons

    # Heta initialize
    t = 0.0 # initial time
    k1 = 7.5
    C = 1.0
    S1 = 0.01 / C
    S2 = 0.012 / C
    reaction1 = C * k1 * S1 * S2
    k2 = 25.0
    S3 = 0.02 / C
    S4 = 0.01 / C
    reaction2 = C * k2 * S3 * S4
    k3 = 0.02
    k4 = 0.02
    
    # save results

    return (
        [
            S1 * C,
            S2 * C,
            S3 * C,
            S4 * C,
        ],
        
        [
            C,
            k1,
            k2,
            k3,
            k4,
        ]
    )
end

### calculate RHS of ODE
function ode_(du, u, p, t)
    cons = p.constants
    (C,k1,k2,k3,k4,) = p.static
    (S1_,S2_,S3_,S4_,) = u 

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * k1 * S1 * S2
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * k2 * S3 * S4
    
    #p.static .= [C,k1,k2,k3,k4,]
    du .= [
      -reaction1+reaction2,  # dS1_/dt
      -reaction1+reaction2,  # dS2_/dt
      reaction1-reaction2,  # dS3_/dt
      reaction1-reaction2,  # dS4_/dt
    ]
end

### output function
function make_saving_(outputIds::Vector{Symbol})
    function saving_(u, t, integrator)
        cons = integrator.p.constants
        (C,k1,k2,k3,k4,) = integrator.p.static
        (S1_,S2_,S3_,S4_,) = u

        # Heta rules
        S1 = S1_ / C
        S2 = S2_ / C
        reaction1 = C * k1 * S1 * S2
        S3 = S3_ / C
        S4 = S4_ / C
        reaction2 = C * k2 * S3 * S4
        
        # calculate amounts
        C_ = C
        reaction1_ = reaction1
        reaction2_ = reaction2
        k1_ = k1
        k2_ = k2
        k3_ = k3
        k4_ = k4

        d = Base.@locals
        return [d[id] for id in outputIds]
    end
end

### time events

### discrete events
function event1_trigger_(u, t, integrator)
    cons = integrator.p.constants
    (C,k1,k2,k3,k4,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * k1 * S1 * S2
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * k2 * S3 * S4
    

    return S2 > S3 ? 1 : -1
end

### continous events


### event assignments
function event1_assignment_(integrator)
    cons = integrator.p.constants
    t = integrator.t
    (C,k1,k2,k3,k4,) = integrator.p.static
    (S1_,S2_,S3_,S4_,) = integrator.u

    # Heta rules
    S1 = S1_ / C
    S2 = S2_ / C
    reaction1 = C * k1 * S1 * S2
    S3 = S3_ / C
    S4 = S4_ / C
    reaction2 = C * k2 * S3 * S4
    
    # recalculated values
    (S1,S4,) = (k3 * t,k4 * S1 * t,)
    
    # save results

    integrator.u .= [
        S1 * C,
        S2 * C,
        S3 * C,
        S4 * C,
    ]
    
    integrator.p.static .= [C,k1,k2,k3,k4,]
end


### OUTPUT ###

x00885 = Model(
  start_,
  ode_,
  [
      DEvent(event1_trigger_, event1_assignment_),
  ],
  make_saving_,
  constants_
)

models = (
    x00885 = x00885
)
tasks = ()

export models, tasks

end
